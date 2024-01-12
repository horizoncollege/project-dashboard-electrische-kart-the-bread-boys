use actix_cors::Cors;
use actix_web::{get, web, App, HttpResponse, HttpServer, Responder};
use serde::ser::{Serialize, SerializeStruct, Serializer};
use std::{env, num::ParseIntError};

use super::{
    database::{AccData, AllData, DatabaseConnection, GpsData, GyroData, Voltage},
    logger::Logger,
};

impl Serialize for Voltage {
    fn serialize<S>(&self, serializer: S) -> Result<S::Ok, S::Error>
    where
        S: Serializer,
    {
        let mut state = serializer.serialize_struct("Voltage", 3)?;
        state.serialize_field("data_id", &self.data_id)?;
        state.serialize_field("time", &self.time)?;
        state.serialize_field("voltage", &self.voltage)?;
        state.end()
    }
}

impl Serialize for AllData {
    fn serialize<S>(&self, serializer: S) -> Result<S::Ok, S::Error>
    where
        S: Serializer,
    {
        let mut state = serializer.serialize_struct("AllData", 11)?;
        state.serialize_field("data_id", &self.data_id)?;
        state.serialize_field("time", &self.time)?;
        state.serialize_field("gps_lat", &self.gps_lat)?;
        state.serialize_field("gps_long", &self.gps_long)?;
        state.serialize_field("acc_x", &self.acc_x)?;
        state.serialize_field("acc_y", &self.acc_y)?;
        state.serialize_field("acc_z", &self.acc_z)?;
        state.serialize_field("gyro_x", &self.gyro_x)?;
        state.serialize_field("gyro_y", &self.gyro_y)?;
        state.serialize_field("gyro_z", &self.gyro_z)?;
        state.serialize_field("voltage", &self.voltage)?;
        state.end()
    }
}

impl Serialize for AccData {
    fn serialize<S>(&self, serializer: S) -> Result<S::Ok, S::Error>
    where
        S: Serializer,
    {
        let mut state = serializer.serialize_struct("AccData", 5)?;
        state.serialize_field("data_id", &self.data_id)?;
        state.serialize_field("time", &self.time)?;
        state.serialize_field("acc_x", &self.acc_x)?;
        state.serialize_field("acc_y", &self.acc_y)?;
        state.serialize_field("acc_z", &self.acc_z)?;
        state.end()
    }
}

impl Serialize for GpsData {
    fn serialize<S>(&self, serializer: S) -> Result<S::Ok, S::Error>
    where
        S: Serializer,
    {
        let mut state = serializer.serialize_struct("GpsData", 4)?;
        state.serialize_field("data_id", &self.data_id)?;
        state.serialize_field("time", &self.time)?;
        state.serialize_field("gps_lat", &self.gps_lat)?;
        state.serialize_field("gps_long", &self.gps_long)?;
        state.end()
    }
}

impl Serialize for GyroData {
    fn serialize<S>(&self, serializer: S) -> Result<S::Ok, S::Error>
    where
        S: Serializer,
    {
        let mut state = serializer.serialize_struct("GyroData", 5)?;
        state.serialize_field("data_id", &self.data_id)?;
        state.serialize_field("time", &self.time)?;
        state.serialize_field("gyro_x", &self.gyro_x)?;
        state.serialize_field("gyro_y", &self.gyro_y)?;
        state.serialize_field("gyro_z", &self.gyro_z)?;
        state.end()
    }
}

pub struct ApiEndpoints {
    hostname: String,
    port: i32,
    cpu_threads: usize,
    log: Logger,
    pub db: DatabaseConnection,
}

impl ApiEndpoints {
    pub async fn new() -> Self {
        let hostname = env::var("HOSTNAME").expect("Expected a HOSTNAME in the environment");
        let port_string = env::var("HOST_PORT").expect("Expected a HOST_PORT in the environment");
        let cpu_threads_string =
            env::var("CPU_THREADS").expect("Expected a number of threads in CPU_THREADS");

        let log = Logger::new("ApiEndPoints");

        let port: i32 = port_string.parse().unwrap();
        let cpu_threads: usize = cpu_threads_string.parse().unwrap();

        let db = match DatabaseConnection::new().await {
            Ok(connection) => connection,
            Err(err) => {
                eprintln!("Failed to create DatabaseConnection: {}", err);
                panic!()
            }
        };

        ApiEndpoints {
            hostname,
            port,
            cpu_threads,
            log,
            db,
        }
    }

    pub async fn start_listening(self) -> std::io::Result<()> {
        let addr = format!("{}:{}", self.hostname, self.port);
        self.log
            .info(format!("Listening at http://{}", addr).as_str());

        HttpServer::new(move || {
            App::new()
                .wrap(Cors::permissive())
                .service(hello)
                .service(all)
                .service(voltage)
                .service(gyro)
                .service(gps)
                .service(acc)
                .service(specific)
                .route("/hey", web::get().to(manual_hello))
        })
        .workers(self.cpu_threads)
        .bind(addr)?
        .run()
        .await
    }
}

async fn getconnection() -> DatabaseConnection {
    let db = match DatabaseConnection::new().await {
        Ok(connection) => connection,
        Err(err) => {
            eprintln!("Failed to create DatabaseConnection: {}", err);
            panic!()
        }
    };
    return db;
}

#[get("/GPS")]
async fn gps() -> impl Responder {
    let mut db = getconnection().await;

    let data = match db.gps().await {
        Ok(data) => data,
        Err(err) => {
            eprintln!("{}", err);
            panic!()
        }
    };

    println!("Handling /GPS endpoint");

    HttpResponse::Ok().json(data)
}

#[get("/SPECIFIC/{start_time}/{end_time}")]
async fn specific(path: web::Path<(String, String)>) -> impl Responder {
    let start_time: Result<i64, ParseIntError> = path.0.clone().parse();
    let end_time: Result<i64, ParseIntError> = path.1.clone().parse();

    match (start_time, end_time) {
        (Ok(start), Ok(end)) => {
            let db = getconnection().await;
            let data = match db.specific(start, end).await {
                Ok(data) => data,
                Err(err) => {
                    eprintln!("{}", err);
                    return HttpResponse::InternalServerError().body("Internal Server Error");
                }
            };

            println!("Handling /SPECIFIC endpoint");
            HttpResponse::Ok().json(data)
        }
        (_, _) => {
            // Parsing failed, return a bad request response
            HttpResponse::BadRequest().body("Invalid start_time or end_time format")
        }
    }
}

#[get("/GYRO")]
async fn gyro() -> impl Responder {
    let mut db = getconnection().await;

    let data = match db.gyro().await {
        Ok(data) => data,
        Err(err) => {
            eprintln!("{}", err);
            panic!()
        }
    };

    println!("Handling /GYRO endpoint");

    HttpResponse::Ok().json(data)
}

#[get("/ACCELERATION")]
async fn acc() -> impl Responder {
    let mut db = getconnection().await;

    let data = match db.acc().await {
        Ok(data) => data,
        Err(err) => {
            eprintln!("{}", err);
            panic!()
        }
    };

    println!("Handling /ACCELERATION endpoint");

    HttpResponse::Ok().json(data)
}

#[get("/VOLTAGE")]
async fn voltage() -> impl Responder {
    let mut db = getconnection().await;

    let data = match db.voltage().await {
        Ok(data) => data,
        Err(err) => {
            eprintln!("{}", err);
            panic!()
        }
    };

    println!("Handling /VOLTAGE endpoint");

    HttpResponse::Ok().json(data)
}

#[get("/ALL")]
async fn all() -> impl Responder {
    let db = getconnection().await;

    let data = match db.all_data().await {
        Ok(data) => data,
        Err(err) => {
            eprintln!("{}", err);
            panic!()
        }
    };

    println!("Handling /ALL endpoint");

    HttpResponse::Ok().json(data)
}

#[get("/")]
async fn hello() -> impl Responder {
    HttpResponse::Ok().json("Hello, this is the backend!")
}

async fn manual_hello() -> impl Responder {
    HttpResponse::Ok().json("Hey there!")
}

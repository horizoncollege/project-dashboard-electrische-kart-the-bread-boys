use std::env;

use actix_web::{get, post, web, App, HttpResponse, HttpServer, Responder};

use super::logger::Logger;

pub struct ApiEndpoints {
    hostname: String,
    port: i32,
    log: Logger,
}

impl ApiEndpoints {
    pub fn new() -> Self {
        let hostname = env::var("HOSTNAME").expect("Expected a HOSTNAME in the environment");
        let portstring = env::var("HOST_PORT").expect("Expected a HOST_PORT in the environment");
        let log = Logger::new("ApiEndPoints");

        let port: i32 = portstring.parse().unwrap();

        ApiEndpoints {
            hostname,
            port,
            log,
        }
    }

    pub async fn start_listening(self) -> std::io::Result<()> {
        let addr = format!("{}:{}", self.hostname, self.port);
        self.log
            .info(format!("Listening at {}", addr).as_str());

        HttpServer::new(move || {
            App::new()
                .service(hello)
                .service(echo)
                .route("/hey", web::get().to(manual_hello))
        })
        .bind(addr)?
        .run()
        .await
    }
}

#[get("/")]
async fn hello() -> impl Responder {
    HttpResponse::Ok().json("Hello world!")
}

#[post("/echo")]
async fn echo(req_body: String) -> impl Responder {
    HttpResponse::Ok().json(req_body)
}

async fn manual_hello() -> impl Responder {
    HttpResponse::Ok().json("Hey there!")
}

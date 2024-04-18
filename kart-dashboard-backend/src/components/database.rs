use super::logger::Logger;
use mysql::prelude::*;
use mysql::*;
use std::env;
use std::sync::Mutex;

// Define the datatypes of all the data

#[derive(Debug, PartialEq)]
pub struct AllData {
    pub data_id: i32,
    pub time: i32,
    pub gps_lat: f64,
    pub gps_long: f64,
    pub acc_x: f64,
    pub acc_y: f64,
    pub acc_z: f64,
    pub gyro_x: f64,
    pub gyro_y: f64,
    pub gyro_z: f64,
    pub voltage: f64,
}

// Acceleration data
#[derive(Debug, PartialEq)]
pub struct AccData {
    pub data_id: i32,
    pub time: i32,
    pub acc_x: f64,
    pub acc_y: f64,
    pub acc_z: f64,
}

#[derive(Debug, PartialEq)]
pub struct GpsData {
    pub data_id: i32,
    pub time: i32,
    pub gps_lat: f64,
    pub gps_long: f64,
}

#[derive(Debug, PartialEq)]
pub struct Voltage {
    pub data_id: i32,
    pub time: i32,
    pub voltage: f64,
}

#[derive(Debug, PartialEq)]
pub struct GyroData {
    pub data_id: i32,
    pub time: i32,
    pub gyro_x: f64,
    pub gyro_y: f64,
    pub gyro_z: f64,
}

// The properties of the connection including the connection
pub struct DatabaseConnection {
    conn: Mutex<PooledConn>,
    log: Logger,
}

#[allow(dead_code)]
impl DatabaseConnection {
    // constructor to connect to the database
    pub async fn new() -> Result<Self, mysql::Error> {
        let database_name =
            env::var("DATABASE_NAME").expect("Expected a DATABASE_NAME in the environment");
        let username =
            env::var("SQL_USERNAME").expect("Expected a SQL_USERNAME in the environment");
        let password =
            env::var("SQL_PASSWORD").expect("Expected a SQL_PASSWORD in the environment");
        let hostname = env::var("SQL_HOSTNAME").expect("Expected a SQL_HOSTNAME in the environment");
        let sql_port = 3306;
        
        let opts = Opts::from_url(&format!(
            "mysql://{}:{}@{}:{}/{}",
            username, password, hostname, sql_port, database_name
        ))?;        
        let log = Logger::new("DatabaseConnection");
        let pool = Pool::new(opts)?;
        let conn = pool.get_conn()?;
        // Mutex to connect with multiple connections at once
        let mutex_conn = Mutex::new(conn);

        Ok(DatabaseConnection {
            conn: mutex_conn,
            log,
        })
    }

    // Fetch all the data
    pub async fn all_data(&self) -> Result<Vec<AllData>, mysql::Error> {
        self.log.info("Executing query to fetch all data");

        // Lock the connection for specific instance
        let mut conn = self.conn.lock()?;

        // Query to select all the data
        let result: Vec<AllData> = conn.query_map(
            "
            SELECT *
            FROM (
            SELECT sensor_data.data_ID, time, gps_lat, gps_long, acc_x, acc_y, acc_z, gyro_x, gyro_y, gyro_z, voltage
            FROM sensor_data 
            INNER JOIN voltage_data ON sensor_data.data_ID = voltage_data.data_ID 
            INNER JOIN gyroscope_data ON sensor_data.data_ID = gyroscope_data.data_ID 
            INNER JOIN acceleration_data ON sensor_data.data_ID = acceleration_data.data_ID 
            INNER JOIN gps_data ON sensor_data.data_ID = gps_data.data_ID
            ORDER BY time DESC
            LIMIT 50
            ) AS subquery
            ORDER BY time ASC;
            ",
            // Format all the data into the structs
            |(data_id, time, gps_lat, gps_long, acc_x, acc_y, acc_z, gyro_x, gyro_y, gyro_z, voltage)| {
                AllData {
                    data_id,
                    time,
                    gps_lat,
                    gps_long,
                    acc_x,
                    acc_y,
                    acc_z,
                    gyro_x,
                    gyro_y,
                    gyro_z,
                    voltage,
                }
            },
        )?;

        // return the data as the struct format
        self.log.info("Query executed successfully");
        Ok(result)
    }

    // Query to fetch specific data
    pub async fn specific(
        &self,
        start_time: i64,
        end_time: i64,
    ) -> Result<Vec<AllData>, mysql::Error> {
        self.log.info(
            format!(
                "Executing query to fetch specific data. Start time: {}. End time: {}.",
                start_time, end_time
            )
            .as_str(),
        );

        // Lock the connection for specific instance
        let mut conn = self.conn.lock()?;

        // Query to select all the data based on the user's need
        let result: Vec<AllData> = conn.query_map(format!(
            "
            SELECT sensor_data.data_ID, time, gps_lat, gps_long, acc_x, acc_y, acc_z, gyro_x, gyro_y, gyro_z, voltage
            FROM sensor_data
            INNER JOIN voltage_data ON sensor_data.data_ID = voltage_data.data_ID 
            INNER JOIN gyroscope_data ON sensor_data.data_ID = gyroscope_data.data_ID 
            INNER JOIN acceleration_data ON sensor_data.data_ID = acceleration_data.data_ID
            INNER JOIN gps_data ON sensor_data.data_ID = gps_data.data_ID
            WHERE time BETWEEN {} AND {}", start_time, end_time),
            // Format all the data into the structs
            |(data_id, time, gps_lat, gps_long, acc_x, acc_y, acc_z, gyro_x, gyro_y, gyro_z, voltage)| {
                AllData {
                    data_id,
                    time,
                    gps_lat,
                    gps_long,
                    acc_x,
                    acc_y,
                    acc_z,
                    gyro_x,
                    gyro_y,
                    gyro_z,
                    voltage,
                }
            },
        )?;

        // return the data as the struct format
        self.log.info("Query executed successfully");
        Ok(result)
    }

    // Fetch all voltage data
    pub async fn voltage(&mut self) -> Result<Vec<Voltage>, mysql::Error> {
        self.log.info("Fetching all the voltage data");

        // Lock the connection for specific instance
        let mut conn = self.conn.lock()?;

        // Query to select all the data based on the user's need
        let result: Vec<Voltage> = conn.query_map(
            "SELECT sensor_data.data_ID, time, voltage FROM sensor_data INNER JOIN voltage_data ON sensor_data.data_ID = voltage_data.data_ID",
            // Format all the data into the structs
            |(data_id, time, voltage)| {
                Voltage {
                    data_id,
                    time,
                    voltage,
                }
            },
        )?;

        // return the data as the struct format
        self.log.info("Query executed successfully");
        Ok(result)
    }

    pub async fn gyro(&mut self) -> Result<Vec<GyroData>, mysql::Error> {
        self.log.info("Fetching all the gyro data");

        // Lock the connection for specific instance
        let mut conn = self.conn.lock()?;

        // Query to select all the data based on the user's need
        let result: Vec<GyroData> = conn.query_map(
            "SELECT sensor_data.data_ID, time, gyro_x, gyro_y, gyro_z from sensor_data 
            INNER JOIN gyroscope_data on sensor_data.data_ID = gyroscope_data.data_ID",
            |(data_id, time, gyro_x, gyro_y, gyro_z)| GyroData {
                data_id,
                time,
                gyro_x,
                gyro_y,
                gyro_z,
            },
        )?;

        // return the data as the struct format
        self.log.info("Query executed successfully");
        Ok(result)
    }

    pub async fn gps(&mut self) -> Result<Vec<GpsData>, mysql::Error> {
        self.log.info("Fetching all the gps data");

        // Lock the connection for specific instance
        let mut conn = self.conn.lock()?;

        // Query to select all the data based on the user's need
        let result: Vec<GpsData> = conn.query_map(
            "SELECT sensor_data.data_ID, time, gps_lat, gps_long from sensor_data 
            INNER JOIN gps_data on sensor_data.data_ID = gps_data.data_ID",
            // Format all the data into the structs
            |(data_id, time, gps_lat, gps_long)| GpsData {
                data_id,
                time,
                gps_lat,
                gps_long,
            },
        )?;

        // return the data as the struct format
        self.log.info("Query executed successfully");
        Ok(result)
    }
    pub async fn acc(&mut self) -> Result<Vec<AccData>, mysql::Error> {
        self.log.info("Fetching all the acceleration data");

        // Lock the connection for specific instance
        let mut conn = self.conn.lock()?;

        // Query to select all the data based on the user's need
        let result: Vec<AccData> = conn.query_map(
            "SELECT sensor_data.data_ID , time, acc_x, acc_y, acc_z from sensor_data 
            INNER JOIN acceleration_data on sensor_data.data_ID = acceleration_data.data_ID",
            // Format all the data into the structs
            |(data_id, time, acc_x, acc_y, acc_z)| AccData {
                data_id,
                time,
                acc_x,
                acc_y,
                acc_z,
            },
        )?;

        // return the data as the struct format
        self.log.info("Query executed successfully");
        Ok(result)
    }
}

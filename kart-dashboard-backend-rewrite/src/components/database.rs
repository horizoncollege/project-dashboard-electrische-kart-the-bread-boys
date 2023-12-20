use mysql::prelude::*;
use mysql::*;
use std::env;

#[derive(Debug, PartialEq)]

pub struct AllData { 
    
}
pub struct Voltage {
    pub data_id: i32,
    pub time: i32,
    pub voltage: f32,
}

#[derive(Debug, PartialEq)]

pub struct GpsData {
    data_id: i32,
    time: i32,
    gyro_x: f32,
    gyro_y: f32,
    gyro_z: f32,
}

pub struct DatabaseConnection {
    conn: PooledConn,
}

impl DatabaseConnection {
    pub async fn new() -> Result<Self, mysql::Error> {
        let database_name =
            env::var("DATABASE_NAME").expect("Expected a DATABASE_NAME in the environment");
        let username =
            env::var("SQL_USERNAME").expect("Expected a SQL_USERNAME in the environment");
        let password =
            env::var("SQL_PASSWORD").expect("Expected a SQL_PASSWORD in the environment");
        let hostname = env::var("HOSTNAME").expect("Expected a HOSTNAME in the environment");
        let sql_port = 3306;

        let opts = Opts::from_url(&format!(
            "mysql://{}:{}@{}:{}/{}",
            username, password, hostname, sql_port, database_name
        ))?;

        let pool = Pool::new(opts)?;
        let conn = pool.get_conn()?;
        Ok(DatabaseConnection { conn })
    }

    // pub async fn get_all(&mut self) -> Result<Vec<Voltage>, mysql::Error> {

    // }

    pub async fn voltage(&mut self) -> Result<Vec<Voltage>, mysql::Error> {
        let result: Vec<Voltage> = self.conn.query_map(
            "SELECT sensor_data.data_ID, time, voltage FROM sensor_data INNER JOIN voltage_data ON sensor_data.data_ID = voltage_data.data_ID",
            |(data_id, time, voltage)| {
                Voltage {
                    data_id,
                    time,
                    voltage,
                }
            },
        )?;
        Ok(result)
    }

    pub async fn gyro(&mut self) -> Result<Vec<GpsData>, mysql::Error> {
        let result: Vec<GpsData> = self.conn.query_map(
            "SELECT sensor_data.data_ID, time, gyro_x, gyro_y, gyro_z from sensor_data 
            INNER JOIN gyroscope_data on sensor_data.data_ID = gyroscope_data.data_ID",
            |(data_id, time, gyro_x, gyro_y, gyro_z)| GpsData {
                data_id,
                time,
                gyro_x,
                gyro_y,
                gyro_z,
            },
        )?;
        Ok(result)
    }
}

mod components;
use components::{database::DatabaseConnection, logger::Logger, api::ApiEndpoints};
use dotenv::dotenv;

#[tokio::main]
async fn main() {
    dotenv().ok();
    let log: Logger = Logger::new("main");

    log.info("Starting API");
    let api = ApiEndpoints::new();

    let mut db = match DatabaseConnection::new().await {
        Ok(connection) => connection,
        Err(err) => {
            eprintln!("Failed to create DatabaseConnection: {}", err);
            return;
        }
    };
    // println!("{:?}", db.voltage().await);
    // println!("{:?}", db.gyro().await);

    if let Ok(voltage_data_array) = db.voltage().await {
        for voltage_data in voltage_data_array {
            println!("{}V", voltage_data.voltage);
        }
    }
    let _ = api.start_listening().await;
}

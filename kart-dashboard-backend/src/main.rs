mod components;
use components::{logger::Logger, api::ApiEndpoints};
use dotenv::dotenv;
use actix_rt;

#[actix_rt::main]
async fn main() {
    // Check if the .env file is okay
    dotenv().ok();
    // Create a new logger instance
    let log: Logger = Logger::new("main");

    // Start the API
    log.info("Starting API");
    let api = ApiEndpoints::new().await;

    // Wait for user input
    match api.start_listening().await {
        Ok(()) => println!("ctrl-c has been pressed 😂"),
        Err(err) => eprintln!("Error occured: {}", err),
    }
}

mod components;
use components::{logger::Logger, api::ApiEndpoints};
use dotenv::dotenv;
use actix_rt;

#[actix_rt::main]
async fn main() {
    dotenv().ok();
    let log: Logger = Logger::new("main");

    log.info("Starting API");
    let api = ApiEndpoints::new().await;

    match api.start_listening().await {
        Ok(()) => println!("ctrl-c has been pressed 😂"),
        Err(err) => eprintln!("Error occured: {}", err),
    }
}

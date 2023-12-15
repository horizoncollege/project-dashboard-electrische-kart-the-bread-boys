mod components;
use influxdb::{Client, Query, Timestamp, ReadQuery};
use influxdb::InfluxDbWriteable;
use chrono::{DateTime, Utc};
use components::logger::Logger;

#[tokio::main]
// or #[async_std::main] if you prefer
async fn main() {
    // Connect to db `test` on `http://localhost:8086`
    let client: Client = Client::new("http://localhost:8086", "test");
    let log: Logger = Logger::new("main");

    log.info("Hoi");

    #[derive(InfluxDbWriteable)]
    struct WeatherReading {
        time: DateTime<Utc>,
        humidity: i32,
        #[influxdb(tag)] wind_direction: String,
    }

    // Let's write some data into a measurement called `weather`
    let weather_readings = vec!(
        WeatherReading {
            time: Timestamp::Hours(1).into(),
            humidity: 30,
            wind_direction: String::from("north"),
        }.into_query("weather"),
        WeatherReading {
            time: Timestamp::Hours(2).into(),
            humidity: 40,
            wind_direction: String::from("west"),
        }.into_query("weather"),
    );

    let write_result = client
        .query(weather_readings)
        .await;
    assert!(write_result.is_ok(), "Write result was not okay");

    // Let's see if the data we wrote is there
    let read_query = ReadQuery::new("SELECT * FROM weather");

    let read_result = client.query(read_query).await;
    assert!(read_result.is_ok(), "Read result was not ok");
    println!("{}", read_result.unwrap());
}
use chrono::{DateTime, Local};

pub struct Logger {
    structname: String,
}

#[allow(dead_code)]
impl Logger {
    #[allow(dead_code)]
    // Constructor
    pub fn new(structname: &str) -> Self {
        let structname = structname.to_string();
        Logger { structname }
    }

    // Log with time
    fn log_with_time(&self) -> String {
        let current_time: DateTime<Local> = Local::now();
        let formatted_time = current_time.format("%d-%m-%Y %H:%M:%S").to_string();
        formatted_time
    }

    // Print out the message, level, and structname
    fn log(&self, level: &str, message: &str) {
        let level: String = level.to_string();
        let message: String = message.to_string();
        let time: String = self.log_with_time();
        println!("[{} {} - {}]: {}", time, self.structname, level, message)
    }

    // Warnings
    pub fn warning(&self, message: &str) {
        self.log("WARNING", message);
    }

    // Errors
    pub fn error(&self, message: &str) {
        self.log("ERROR", message);
    }

    // Info
    pub fn info(&self, message: &str) {
        self.log("INFO", message);
    }

    // Debug
    pub fn debug(&self, message: &str) {
        self.log("DEBUG", message);
    }
}

use chrono::{DateTime, Local};

pub struct Logger {
    structname: String,
}

impl Logger {
    #[allow(dead_code)]
    pub fn new(structname: &str) -> Self {
        let structname = structname.to_string();
        Logger { structname }
    }

    fn log_with_time(&self) -> String {
        let current_time: DateTime<Local> = Local::now();
        let formatted_time = current_time.format("%d-%m-%Y %H:%M:%S").to_string();
        formatted_time
    }

    fn log(&self, level: &str, message: &str) {
        let level: String = level.to_string();
        let message: String = message.to_string();
        let time: String = self.log_with_time();
        println!("[{} {} - {}]: {}", time, self.structname, level, message)
    }

    #[allow(dead_code)]
    pub fn warning(&self, message: &str) {
        self.log("WARNING", message);
    }

    pub fn error(&self, message: &str) {
        self.log("ERROR", message);
    }

    pub fn info(&self, message: &str) {
        self.log("INFO", message);
    }

    pub fn debug(&self, message: &str) {
        self.log("DEBUG", message);
    }
}

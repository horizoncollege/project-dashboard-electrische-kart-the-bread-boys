class Logger {
    private classname: string;

    constructor(classsname: string) {
        this.classname = classsname;
    }

    // Log time
    private logWithTime(): string {
        const currentDate = new Date();

        const day = String(currentDate.getDate()).padStart(2, '0');
        const month = String(currentDate.getMonth() + 1).padStart(2, '0');
        const year = currentDate.getFullYear();

        const hours = String(currentDate.getHours()).padStart(2, '0');
        const minutes = String(currentDate.getMinutes()).padStart(2, '0');

        return `${day}-${month}-${year} ${hours}:${minutes}`;
    }

    // Log info
    public Info(message: string) {
        this.Log(message, "INFO");
    }

    // log warning
    public Warning(message: string) {
        this.Log(message, "WARNING");
    }

    // log debug
    public Debug(message: string) {
        this.Log(message, "DEBUG");
    }

    // error
    public Error(message: string) {
        this.Log(message, "ERROR");
    }

    // Log message with classname, message and level
    public Log(message: string, level: string) {
        console.log(`[${this.logWithTime()} - ${this.classname} - ${level}]: ${message}\n`);
    }
}

export default Logger;
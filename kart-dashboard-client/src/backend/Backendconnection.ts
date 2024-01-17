import Logger from "./logger.ts";

export default class BackendConnection {
    // hostname: example localhost
    private hostname: string;
    // port number for the backend
    private port: number;
    // Logger object
    private log: Logger;

    constructor() {
        // New logger object
        const logger = new Logger("BackendConnection");

        // Add logger to properties
        this.log = logger;

        // Log that the constructor is being called 
        this.log.Info("Constructor called");

        // Get hostname from .env
        const hostname = process.env.REACT_APP_HOSTNAME;

        // Get port from .env
        const port = process.env.REACT_APP_BACKEND_PORT;

        // Convert port to an int
        try {
            if (port != null) {
                this.port = parseInt(port);
            }
        } catch (error) {
            // Log any errors
            this.log.Error(`${error}`);
        }

        // Add hostname to properties
        if (hostname != null) {
            this.hostname = hostname;
        }
    }

    // Get all data from api
    public async GetAllData() {
        this.log.Info("Collecting all data from api");
        // Format url
        const response = await fetch(`http://${this.hostname}:${this.port}/ALL`);
        // Convert it to json
        const data = await response.json();
        // Return the result
        return data;
    }
    // Get voltage data from api
    public async GetVolTage() {
        this.log.Info("Collecting all data from api");
        // Format url
        const response = await fetch(`http://${this.hostname}:${this.port}/VOLTAGE`);
        // Convert it to json
        const data = await response.json();
        // Return the result
        return data;
    }
    // Get acceleration data from api
    public async GetAcceleration() {
        this.log.Info("Collecting all data from api");
        // Format url
        const response = await fetch(`http://${this.hostname}:${this.port}/ACCELERATION`);
        // Convert it to json
        const data = await response.json();
        // Return the result
        return data;
    }
    // Get gps data from api
    public async GetGps() {
        this.log.Info("Collecting all data from api");
        // Format url
        const response = await fetch(`http://${this.hostname}:${this.port}/GPS`);
        // Convert it to json
        const data = await response.json();
        // Return the result
        return data;
    }
    // Get gyroscope data from api
    public async GetGyroscope() {
        this.log.Info("Collecting all data from api");
        // Format url
        const response = await fetch(`http://${this.hostname}:${this.port}/GYRO`);
        // Convert it to json
        const data = await response.json();
        // Return the result
        return data;
    }

    // Get all, but specific data based on time from api
    public async GetSpecific(startTime: number, endTime: number) {
        this.log.Info(`Collecting data between ${startTime} and ${endTime}`);
        // Format url
        const response = await fetch(`http://${this.hostname}:${this.port}/SPECIFIC/${startTime}/${endTime}`);
        // Convert it to json
        const data = await response.json();
        // Return the result
        return data;
    }

    // Convert normal human readable time to unix timestamp
    public ConvertDateTimeToUnix(date: string, HoursSeconds: string): number | null {
        // Concatenate date and time strings
        const dateTimeString = `${date} ${HoursSeconds}`;

        // Parse the concatenated string into a Date object
        const dateTime = new Date(dateTimeString);

        // Check if the Date object is valid
        if (isNaN(dateTime.getTime())) {
            console.error('Invalid date or time format');
            return null;
        }

        // Ensure the date and time are valid, considering leap years
        if (
            dateTime.getFullYear() < 1000 ||
            isNaN(dateTime.getMilliseconds())
        ) {
            console.error('Invalid date or time');
            return null;
        }

        const unixTimestamp = Math.floor(dateTime.getTime() / 1000); // Convert to seconds

        return unixTimestamp;
    }

}
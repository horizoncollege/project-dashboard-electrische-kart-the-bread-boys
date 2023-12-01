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
    async GetAllData() {
        this.log.Info("Collecting all data from api");
        // Format url
        const response = await fetch(`http://${this.hostname}:${this.port}/ALL`);
        // Convert it to json
        const data = await response.json();
        // Return the result
        return data;
    }
}
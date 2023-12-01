import Logger from "./logger.ts";

export default class BackendConnection {
    private hostname: string;
    private port: number;
    private log: Logger;

    constructor() {

        const logger = new Logger("BackendConnection");
        this.log = logger;

        this.log.Info("Constructor called");

        const hostname = process.env.REACT_APP_HOSTNAME;
        const port = process.env.REACT_APP_BACKEND_PORT;

        try {
            if (port != null) {
                this.port = parseInt(port);
            }
        } catch (error) {
            this.log.Error(`${error}`);
        }


        if (hostname != null) {
            this.hostname = hostname;
        }
    }

    async GetAllData() {
        this.log.Info("Collecting all data from api");
        const response = await fetch(`http://${this.hostname}:${this.port}/ALL`);
        const data = await response.json();
        return data;
    }

}
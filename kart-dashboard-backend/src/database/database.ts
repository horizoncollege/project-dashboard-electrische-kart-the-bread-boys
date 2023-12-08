import Logger from "./logger.js";
import mysql from "mysql";
import 'dotenv/config'

class DataBase {
    // Logger to log any errors
    private logger: Logger;
    // Database name
    private dbname: string;
    // Sql username
    private sqlname: string;
    //Sql user's password
    private sqlpass: string;
    // the host for the database. example: localhost
    private hostname: string;
    // Db is the connection
    private db: mysql.Connection;

    // Start logger en put database name into variable
    constructor() {
        const dbname = process.env.DATABASE_NAME;
        const sqlusername = process.env.SQL_USERNAME;
        const sqlpass = process.env.SQL_PASSWORD;
        const hostname = process.env.SQL_HOSTNAME;

        // Create new logger
        this.logger = new Logger("DataBase");

        // Set database name in the properties
        if (dbname !== undefined) {
            this.dbname = dbname;
        }

        // Set sql password in the properties, If it's empty just do an empty password
        if (sqlpass !== undefined) {
            this.sqlpass = sqlpass;
        } else {
            this.sqlpass = "";
        }

        // Set the hostname. For example: localhost
        if (hostname !== undefined) {
            this.hostname = hostname;
        }

        // set the sql username in the properties
        if (sqlusername !== undefined) {
            this.sqlname = sqlusername;
        }
        this.logger.Info("constructor called");
    }

    // Connect to the database
    public connectDB() {
        try {
            this.logger.Info(`Attempting to connect to ${this.dbname}`)
            const db = mysql.createConnection({
                host: this.hostname,
                user: this.sqlname,
                password: this.sqlpass,
                database: this.dbname
            });
            // Put the connection in the properties
            this.db = db;
            this.logger.Info(`Connected to ${this.dbname}`);
        } catch (error) {
            this.logger.Error(error);
        }
    }

    public getAllData(): Promise<object[]> {
        return new Promise((resolve, reject) => {
            this.logger.Info(`Listening at http://${process.env.HOSTNAME}:${process.env.HOST_PORT}`);
            this.db.query("SELECT * FROM sensor_data", (error, results) => {
                if (error) {
                    this.logger.Error(`${error}`);
                    reject(error);
                } else {
                    this.logger.Info("Getting all data from database");
                    for (let i = 0; i < results.length; i++) {
                        results[i].voltage = this.getRandomNumber(0, 30);
                    }
                    resolve(results);
                }
            });
        });
    }

    public getVoltage(): Promise<object[]> {
        return new Promise((resolve, reject) => {
            this.logger.Info(`Listening at http://${process.env.HOSTNAME}:${process.env.HOST_PORT}`);
            this.db.query("SELECT voltage FROM sensor_data", (error, results) => {
                if (error) {
                    this.logger.Error(`${error}`);
                    reject(error);
                } else {
                    this.logger.Info("Getting all data from database");
                    resolve(results);
                }
            });
        });
    }

    getRandomNumber(min, max) {
        return Math.floor(Math.random() * (max - min)) + min;
    }

    // Get the database name
    public DBname() {
        this.logger.Info("Returning database name");
        return this.dbname;
    }
}

export default DataBase;
import Logger from "./logger.ts";
import mysql from "mysql";
import express from "express";

const app = express();

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
        const dbname = process.env.REACT_APP_DATABASE_NAME;
        const sqlusername = process.env.REACT_APP_SQL_USERNAME;
        const sqlpass = process.env.REACT_APP_SQL_PASSWORD;
        const hostname = process.env.REACT_APP_SQL_HOSTNAME;

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
    }

    // Connect to the database
    public connectDB() {
        const db = mysql.createConnection({
            host: this.hostname,
            user: this.sqlname,
            password: this.sqlpass,
            database: this.dbname
        });
        // Put the connection in the properties
        this.db = db;
    }

    // Get the database name
    public DBname() {
        this.logger.Info("Returning database name");
        return this.dbname;
    }



    // Create database
    public CreateDatabase() {
        try {

        }
        catch (Error) {
            this.logger.Error(`Database creation has gone wrong: ${Error}`);
        }
    }
}

export default DataBase;

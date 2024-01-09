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

    private async executeQuery(query: string, params: any[] = []): Promise<object[]> {
        return new Promise((resolve, reject) => {
            this.logger.Info(`Executing query: ${query}`);
            this.db.query(query, params, (error, results) => {
                if (error) {
                    this.logger.Error(`Error executing query: ${error}`);
                    reject(error);
                } else {
                    this.logger.Info("Query executed successfully");
                    resolve(results);
                }
            });
        });
    }

    public getAllData(start_time, end_time): Promise<object[]> {
        const query: string = `
        SELECT sensor_data.data_ID, date, time, voltage, gps_lat, gps_long, acc_x, acc_y, acc_z, gyro_x, gyro_y, gyro_z 
        FROM sensor_data 
        INNER JOIN voltage_data ON sensor_data.data_ID = voltage_data.data_ID 
        INNER JOIN gyroscope_data ON sensor_data.data_ID = gyroscope_data.data_ID 
        INNER JOIN acceleration_data ON sensor_data.data_ID = acceleration_data.data_ID 
        INNER JOIN gps_data ON sensor_data.data_ID = gps_data.data_ID
        where time between ${start_time} and ${end_time}`
        return this.executeQuery(query);
    }

    // Get the voltage data
    public getVoltage(): Promise<object[]> {
        const query: string = `
        SELECT sensor_data.data_ID, date , time, voltage from sensor_data 
        INNER JOIN voltage_data on sensor_data.data_ID = voltage_data.data_ID`
        return this.executeQuery(query);
    }

    // Acceleration data
    public getAcceleration(): Promise<object[]> {
        const query: string = `
        SELECT  sensor_data.data_ID, date , time, acc_x, acc_y, acc_z from sensor_data 
        INNER JOIN acceleration_data on sensor_data.data_ID = acceleration_data.data_ID`
        return this.executeQuery(query);
    }

    // GPS data
    public getGPS(): Promise<object[]> {
        const query: string = `
        SELECT sensor_data.data_ID, date , time, gps_lat, gps_long from sensor_data 
        INNER JOIN gps_data on sensor_data.data_ID = gps_data.data_ID`;
        return this.executeQuery(query);
    }

    // Get gyro data
    public getGyroscope(): Promise<object[]> {
        const query: string = `
        SELECT sensor_data.data_ID, date , time, gyro_x, gyro_y, gyro_z from sensor_data 
        INNER JOIN gyroscope_data on sensor_data.data_ID = gyroscope_data.data_ID`;
        return this.executeQuery(query);
    }

    // Get speed
    public getSpeed(): Promise<object[]> {
        const query: string = `
        SELECT sensor_data.data_ID, date , time, gps_lat, gps_long from sensor_data 
        INNER JOIN gps_data on sensor_data.data_ID = gps_data.data_ID`;
        const result = this.executeQuery(query);
        return result;
    }

    // Get the database name
    public DBname() {
        this.logger.Info("Returning database name");
        return this.dbname;
    }
}

export default DataBase;
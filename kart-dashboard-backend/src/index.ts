import express from "express";
import Database from './database/database.js';
import Logger from "./database/logger.js";
import cors from "cors";
const log = new Logger('index');

// Allow cross origin, because it's an api
const corsOptions = {
    origin: '*',
    methods: 'GET,HEAD,PUT,PATCH,POST,DELETE',
    credentials: true,
    optionsSuccessStatus: 204,
};

// Create a express object
const app = express();

// Create a new database object
const db = new Database();

//time and date prototype values
const start_time = 1698913481;
const end_time = 1698913654;
const date = "2023-11-02"

// Connect to database
db.connectDB();

// Open port using .env
app.listen(process.env.HOST_PORT, () => {
    log.Info("Connected to backend");
});

// Create a root
app.get("/", cors(corsOptions), (req, res) => {
    res.json("Hello, this is the backend!");
});

// Url params ALL for all data
app.get("/ALL", cors(corsOptions), async (req, res) => {
    try {
        const data = await db.getAllData(date, start_time, end_time);
        res.json(data);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

app.get("/VOLTAGE", cors(corsOptions), async (req, res) => {
    try {
        const data = await db.getVoltage();
        res.json(data);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});
app.get("/ACCELERATION", cors(corsOptions), async (req, res) => {
    try {
        const data = await db.getAcceleration();
        res.json(data);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

app.get("/GPS", cors(corsOptions), async (req, res) => {
    try {
        const data = await db.getGPS();
        res.json(data);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

app.get("/SPEED", cors(corsOptions), async (req, res) => {
    try {
        const data = await db.getSpeed();
        res.json(data);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

app.get("/GYRO", cors(corsOptions), async (req, res) => {
    try {
        const data = await db.getGyroscope();
        res.json(data);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});


log.Info(`Listening at http://${process.env.HOSTNAME}:${process.env.HOST_PORT}`);
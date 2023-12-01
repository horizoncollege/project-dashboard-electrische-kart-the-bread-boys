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
        const data = await db.getAllData();
        res.json(data);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});


log.Info("Listening");


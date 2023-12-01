import express from "express";
import Database from './database/database.js';
import Logger from "./database/logger.js";
const log = new Logger('index');

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
app.get("/", (req, res) => {
    res.json("Hello this is backend!");
});

// Url params ALL for all data
app.get("/ALL", async (req, res) => {
    try {
        const data = await db.getAllData();
        res.json(data);
    } catch (error) {
        console.error(error);
    }
});


log.Info("Listening");


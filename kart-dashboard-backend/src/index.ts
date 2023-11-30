import express from "express";
import Database from './database/database.js';
import Logger from "./database/logger.js";
const log = new Logger('index');

const app = express();

const db = new Database();

db.connectDB();

app.listen(8800, () => {
    log.Info("Connected to backend");
});

app.get("/", (req, res) => {
    res.json("Bonjour front-end");
});

app.get("/ALL", async (req, res) => {
    try {
        const data = await db.getAllData();
        res.json(data);
    } catch (error) {
        console.error(error);
    }
});


console.log("starting\n");


log.Info('Hello, world!\n');


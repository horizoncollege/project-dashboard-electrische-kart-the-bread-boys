console.log("starting\n");

import Logger from "./database/logger.js";
import Database from './database/database.js';

const log = new Logger('index');

log.Info('Hello, world!\n');

const db = new Database();

db.connectDB();

try {
    const data = await db.getAllData();
    console.log(data);
} catch (error) {
    console.error(error);
}

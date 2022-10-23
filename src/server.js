import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import cakeRouter from './routers/cakesRouters.js';
import clientRouter from './routers/clientsRouters.js';
import orderRouter from './routers/orderRouters.js';
import flavoursRoute from './routers/flavoursRouters.js';

dotenv.config();

const server = express();
server.use(cors());
server.use(express.json());

server.use(cakeRouter);
server.use(clientRouter);
server.use(orderRouter);
server.use(flavoursRoute);

server.listen(process.env.PORT, () => console.log(`server listening on Port ${process.env.PORT}`));
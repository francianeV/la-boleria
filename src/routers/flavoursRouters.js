import { validaFlavour } from "../middlewares/flavourMiddleware.js";
import { insertFlavour } from "../controllers/flavoursController.js";
import { Router } from 'express';

const flavoursRoute = Router();

flavoursRoute.post('/flavours', validaFlavour, insertFlavour);

export default flavoursRoute;


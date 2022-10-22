import { Router } from 'express';
import { validaCake } from '../middlewares/cakeMiddleware.js';
import { insertCake } from '../controllers/cakesController.js'

const cakeRouter = Router();

cakeRouter.post("/cakes", validaCake, insertCake);

export default cakeRouter;
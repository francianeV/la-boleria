import { Router } from 'express';
import { insertClient } from '../controllers/clientsController.js';
import { validaClient } from '../middlewares/clientMiddleware.js';

const clientRouter = Router();

clientRouter.post('/clients', validaClient, insertClient);

export default clientRouter;

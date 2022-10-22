import { Router } from 'express';
import { createOrder, getOrders } from '../controllers/ordersController.js';
import { validaOrder } from '../middlewares/orderMiddleware.js';

const orderRouter = Router();

orderRouter.post('/order', validaOrder, createOrder);
orderRouter.get('/orders', getOrders);

export default orderRouter;
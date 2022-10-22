import { Router } from 'express';
import { createOrder, 
         getOrders, 
         getOrderById,
         getClientOrders } from '../controllers/ordersController.js';
import { validaOrder } from '../middlewares/orderMiddleware.js';

const orderRouter = Router();

orderRouter.post('/order', validaOrder, createOrder);
orderRouter.get('/orders', getOrders);
orderRouter.get('/orders/:id', getOrderById);
orderRouter.get('/clients/:id/orders', getClientOrders);

export default orderRouter;
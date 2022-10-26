import { Router } from 'express';
import { createOrder, 
         getOrders, 
         getOrderById,
         getClientOrders,
         isDelivered } from '../controllers/ordersController.js';
import { validaOrder } from '../middlewares/orderMiddleware.js';

const orderRouter = Router();

orderRouter.post('/order', validaOrder, createOrder);
orderRouter.get('/orders', getOrders);
orderRouter.get('/orders/:id', getOrderById);
orderRouter.get('/clients/:id/orders', getClientOrders);
orderRouter.patch('/order/:id', isDelivered);

export default orderRouter;
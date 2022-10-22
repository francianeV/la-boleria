import { orderSchema } from "../schemas/orderSchema.js";

export function validaOrder(req, res, next){
    const { quantity, clientId, cakeId } = req.body;

    const validation = orderSchema.validate({ quantity, clientId, cakeId}, { abortyEarly: false });

    if(validation.error){
        return res.status(400).send(validation.error.message);
    }

    next();
}
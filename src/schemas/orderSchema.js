import joi from 'joi';

const orderSchema = joi.object({
    clientId: joi.number().required(),
    cakeId: joi.number().required(),
    quantity: joi.number().positive().integer().greater(0).less(5).required()
})

export { orderSchema };
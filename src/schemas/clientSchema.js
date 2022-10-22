import joi from 'joi';

const clientSchema = joi.object({
    name: joi.string().min(2).required(),
    address: joi.string().required(),
    phone: joi.string().min(10).max(11).required().regex(/^\d+$/)
    
})

export { clientSchema };
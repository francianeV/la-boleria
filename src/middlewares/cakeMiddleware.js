import { cakeSchema } from '../schemas/cakeSchemas.js'

export function validaCake(req, res, next){
    const { name, price, image, description } = req.body;

    const validation = cakeSchema.validate({ name, price, image, description }, { abortyEarly: false });

    if(validation.error){
        return res.status(400).send(validation.error.message);
    }

    next();
}
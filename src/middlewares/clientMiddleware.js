import { clientSchema } from "../schemas/clientSchema.js";

export function validaClient(req, res, next){
    const { name, address, phone } = req.body;

    const validation = clientSchema.validate({ name, address, phone }, { abortyEarly: false });

    if(validation.error){
        return res.status(400).send(validation.error.message);
    }

    next();
}
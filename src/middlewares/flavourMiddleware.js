import { flavourSchema } from "../schemas/flavourSchema.js";

export function validaFlavour(req, res, next){
    const { name } = req.body;

    const validation = flavourSchema.validate({ name }, { abortyEarly: false });

    if(validation.error){
        return res.status(400).send(validation.error.message);
    }

    next();
}
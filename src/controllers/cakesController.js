import * as cakeRepositories from '../repositories/cakesRepositories.js';

async function insertCake(req, res){
    const { name, price, image, description, flavourId } = req.body;

    try{

        const validCake = await cakeRepositories.findCake(name);

        if(validCake.rowCount > 0){
            return res.sendStatus(409);
        }

        const flavorIsValid = await cakeRepositories.findFlavour(flavourId);

        if(flavorIsValid.rowCount === 0 ){
            return res.sendStatus(404);
        }

        await cakeRepositories.insertCake(name, price, image, description, flavourId);

        res.sendStatus(201)
    }catch(err){
        console.log(err);
        res.sendStatus(500);
    }

}

export { insertCake };
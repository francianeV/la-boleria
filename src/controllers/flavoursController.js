import * as flavoursRepositories from '../repositories/flavoursRepositories.js';

async function insertFlavour(req, res){
    const { name } = req.body;

    try{
        const validateFlavour = await flavoursRepositories.findFlavour(name);

        if(validateFlavour.rowCount > 0){
            return res.sendStatus(409);
        }
        
        await flavoursRepositories.insertFlavour(name);

        res.sendStatus(200);

    }catch(err){
        console.log(err);
        res.sendStatus(500);
    }
}

export { insertFlavour };
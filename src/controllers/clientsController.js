import * as clientRepositories from '../repositories/clientsRepositories.js';

async function insertClient(req, res){
    const { name, address, phone } = req.body;

    try{
        await clientRepositories.insertClient(name, address, phone);

        res.sendStatus(201);    

    }catch(err){
        console.log(err);
        res.sendStatus(500);
    }
}

export { insertClient };
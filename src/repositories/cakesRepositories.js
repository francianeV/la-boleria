import connection from '../database/db.js';

async function insertCake(name, price, image, description, flavourId){
    return connection.query(`
        INSERT INTO cakes (name, price, image, description, "flavourId") 
        VALUES ($1, $2, $3, $4, $5)`,[name, price, image, description, flavourId]); 
}

async function findCake(name){
    return connection.query(`SELECT * FROM cakes WHERE name = $1`, [name]);
}

async function findFlavour(flavourId){
    return connection.query(`SELECT * FROM flavours WHERE id = $1`, [flavourId]);
}

export { insertCake, findCake, findFlavour };
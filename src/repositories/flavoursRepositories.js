import connection from "../database/db.js";

async function insertFlavour(name){
    return connection.query(`INSERT INTO flavours (name) VALUES ($1)`,[name]);
}

async function findFlavour(name){
    return connection.query(`SELECT * FROM flavours WHERE name = $1`,[name]);
}


export { insertFlavour, findFlavour };
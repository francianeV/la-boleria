import connection from "../database/db.js";

async function insertClient(name, address, phone){
    return connection.query(`INSERT INTO clients (name, address, phone) VALUES ($1, $2, $3)`,[name, address, phone]);
}

async function findClient(name){
    return connection.query(`SELECT * FROM clients WHERE name = $1`,[name])
}

export { insertClient };
import connection from "../database/db.js";

async function createOrder(clientId, cakeId, quantity, totalPrice){
    
    return connection.query(`
        INSERT INTO orders ("clientId", "cakeId", quantity, "totalPrice", "createAt")
        VALUES ($1, $2, $3, $4, NOW())`,[clientId, cakeId, quantity,totalPrice])
}

async function getClientId(clientId){
    return connection.query(`SELECT * FROM clients WHERE id = $1`,[clientId]);
}

async function getCakeId(cakeId){
    return connection.query(`SELECT * FROM cakes WHERE id = $1`,[cakeId]);
}

async function getOrders(date){
    let findDate = '';

    if(date){
        findDate = `WHERE DATE("createAt") = ${date}`;
    }

    return connection.query(
        {
        text: `
        ${query} ${findDate};  
    `,
    rowMode: 'array'},);
}

async function getOrder(id){
    const findId = `WHERE orders.id = $1`;

    return connection.query({
        text: `
        ${query} ${findId};  
    `,
    rowMode: 'array'},[id]);
}

async function getClientOrders(id){
    return connection.query(
        `SELECT 
            orders.id AS "orderId",
            quantity,
            "createAt",
            "totalPrice",
            cakes.name AS "cakeName"
        FROM orders 
        JOIN cakes ON orders."cakeId" = cakes.id
        JOIN clients ON orders."clientId" = clients.id WHERE clients.id = $1`,[id]
    )
}

const query = `
    SELECT 
        orders.id, 
        "createAt", 
        quantity, 
        "totalPrice",
        clients.id as "clientId", 
        clients.name AS "name",
        clients.address AS "address",
        clients.phone AS phone,
        cakes.id AS "cakeId",
        cakes.name AS name,
        cakes.price AS price,
        cakes.description AS description,
        cakes.image AS image
    FROM orders 
    JOIN clients ON clients.id = orders."clientId"
    JOIN cakes ON orders."cakeId" = cakes.id  
    `;
    

export { createOrder, getClientId, getCakeId, getOrders, getOrder, getClientOrders };
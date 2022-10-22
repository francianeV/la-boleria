import * as ordersRepositories from "../repositories/ordersRepositories.js";

async function createOrder(req, res){
    const { clientId, cakeId, quantity } = req.body;

    try{
        const validateClient = await ordersRepositories.getClientId(clientId);

        const validateCake = await ordersRepositories.getCakeId(cakeId);

        if(validateClient.rowCount === 0){
            return res.sendStatus(404);
        }

        if(validateCake.rowCount === 0){
            return res.sendStatus(404);
        }

        const totalPrice = quantity  * validateCake.rows[0].price;

        await ordersRepositories.createOrder(clientId, cakeId, quantity, totalPrice.toFixed(2));

        res.sendStatus(201);

    }catch(err){
        console.log(err);
        res.sendStatus(500);
    }
}

async function getOrders(req, res){
    const { date } = req.query;

    try{

        const orders = await ordersRepositories.getOrders(date);

        if(orders.rowCount === 0){
            return res.status(404).send(orders.rows[0]);
        }

        res.status(200).send(orders.rows.map(_mapOrdersArrayToObject));

    }catch(err){
        console.log(err);
        res.sendStatus(500);
    }
}

async function getOrderById(req, res){
    const { id } = req.params;

    const order = await ordersRepositories.getOrder(id);

    if(order.rowCount === 0){
        return res.sendStatus(404);
    }

    res.status(200).send(order.rows.map(_mapOrdersArrayToObject));
}

async function getClientOrders(req, res){
    const { id } = req.params;

    const clientOrders = await ordersRepositories.getClientOrders(id);

    if(clientOrders.rowCount === 0){
        return res.sendStatus(404);
    }

    res.status(200).send(clientOrders.rows)
}

function _mapOrdersArrayToObject(row){
    const [
        id,
        createAt,
        quantity,
        totalPrice, 
        clientId,
        clientName,
        address,
        phone,
        cakeId,
        cakeName,
        price,
        description,
        image
    ] = row;

    return {
        client: {
            id: clientId,
            name: clientName,
            address: address,
            phone: phone
        },
        cake: {
            id: cakeId,
            name: cakeName,
            price: price,
            description: description,
            image: image
        },
        orderId: id,
        createAt,
        quantity,
        totalPrice
    }
        
}

export { createOrder, 
         getOrders,
         getOrderById, 
         getClientOrders };
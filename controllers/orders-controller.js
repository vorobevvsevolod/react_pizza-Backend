const ApiError = require('../error/ApiError')
const { PizzasSizes, Orders, OrderProduct} = require('../models/models')
const {NUMBER} = require("sequelize");

class OrdersController {
	
	async create (req, res, next){
		try {
			const {  products, address, phone } = req.body;
			if (!products || !address) return next(ApiError.badRequest('Нет данных'));
			let totalPrice = 0;
			products.map((item) => totalPrice += item.price * item.quantity)
			let order;
			if(phone){
				 order = await Orders.create({
					total_price: totalPrice,
					address: address,
					phone: phone
				})
			} else {
				 order = await Orders.create({
					total_price: totalPrice,
					address: address,
					userId: req.userId
				})
			}
			
			const promises = await products.map(item => {
				if(item.productId){
					OrderProduct.create({
						orderId: order.id,
						productId: item.productId,
						quantity: item.quantity,
						price: item.price,
						description: item.description
					})
				} else {
					OrderProduct.create({
						orderId: order.id,
						pizzasSizesVariantId: item.pizzasSizesVariantId,
						quantity: item.quantity,
						price: item.price,
						description: item.description
					})
				}
			})
			
			
			return res.json({message: order})
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	
	async getAll (req, res, next){
		try {
			if(req.phone){
				const orders = await Orders.findAll({where: {
					phone: req.phone
					}})
				return res.json({message: orders})
			} else {
				const orders = await Orders.findAll({where: {
						userId: req.userId
					}})
				return res.json({message: orders})
			}
			
			
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	
}

module.exports = new OrdersController();
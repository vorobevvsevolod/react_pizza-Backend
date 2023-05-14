const ApiError = require('../error/ApiError')
const { PizzasSizes, Orders, OrderProduct, OrderStatus} = require('../models/models')
const {NUMBER, STRING} = require("sequelize");

class OrdersController {
	
	async create (req, res, next){
		try {
			const {  products, address, phone } = req.body;
			if (!products || !address) return next(ApiError.badRequest('Нет данных'));
			let totalPrice = 0;
			products.map((item) => totalPrice += item.price * item.quantity)
			let order;
			if(req.userId){
				order = await Orders.create({
					total_price: totalPrice,
					address: address,
					phone: phone.slice(1),
					orderStatusId: 1,
					userId: req.userId
				})
			}else{
				order = await Orders.create({
					total_price: totalPrice,
					address: address,
					phone: phone.slice(1),
					orderStatusId: 1
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
			const { id } = req.query;
			
			if(req.phone){
				if(id){
					const orders = await Orders.findAll({where: {
							phone: req.phone,
							id: id
						}})
					return res.json({message: orders})
				} else {
					const orders = await Orders.findAll({where: {
							phone: req.phone
						}})
					return res.json({message: orders})
				}
			} else {
				if(id){
					const orders = await Orders.findAll({where: {
							userId: req.userId,
							id: id
						}})
					return res.json({message: orders})
				} else {
					const orders = await Orders.findAll({where: {
							userId: req.userId
						}})
					return res.json({message: orders})
				}
			}
			
			
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	
	async getByIdWithPhoneOrToken (req, res, next){
		try {
			const { id } = req.params;
			if ( !id ) return next(ApiError.badRequest('Нет данных'));
			console.log(req.query);
			
			if(req.phone){
				const orders = await Orders.findOne({where: {
						phone: req.phone,
						id: id
					}})
				return res.json({message: orders})
			} else {
				const orders = await Orders.findOne({where: {
						userId: req.userId,
						id: id
					}})
				return res.json({message: orders})
			}
			
		}catch (e){
			return next(ApiError.internal(e.message));
		}
	}
	
	
	async getStatus (req, res, next){
		try {
			const orderStatus = await OrderStatus.findAll({attributes: ['id', 'name'], order: [["id", "asc"]]});
			return res.json({message: orderStatus})
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
}

module.exports = new OrdersController();
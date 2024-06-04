const ApiError = require('../error/ApiError')
const { Orders, OrderProduct, OrderStatus, Users} = require('../models/models')
const bcrypt = require('bcrypt');
const nodemailer = require('../utilities/nodemailer')

class OrdersController {
	
	async create (req, res, next){
		try {
			const {  products, address, phone } = req.body;
			if (!products || !address || !phone) return next(ApiError.badRequest('Нет данных'));
			let totalPrice = 0;
			products.map((item) => {
				totalPrice += item.price * item.quantity
			} )
			let order;
			if(req.userId){
				order = await Orders.create({
					total_price: Number(totalPrice) ,
					address: address,
					phone: phone.slice(1),
					orderStatusId: 1,
					userId: req.userId
				});

				const user = await Users.findOne({
					where: { id: req.userId }
				})

				if(!user.phone){
					const update = await Users.update({
						phone: phone
					}, {
						where: { id: req.userId }
					})
				}

				

			}else{
				
				order = await Orders.create({
					total_price: totalPrice,
					address: address,
					phone: phone.slice(1),
					orderStatusId: 1
				})
			}

			if(!order) return next(ApiError.badRequest('Ошибка создания заказа!'));

			const combinedString = `${phone}-${order.id}`;
					
			const hashedOrderNumber = bcrypt.hashSync(combinedString, 5); 
				
			const uniqueOrderNumber = hashedOrderNumber.slice(10, 20) + `-${order.id}`;

			const orderUpdate = await Orders.update({
				nomer: uniqueOrderNumber
			},
			{
				where: {id: order.id}
			})
			if(req.userId){
				const user = await Users.findOne({
					where: { id: req.userId }
				})
				let mailOptions = {
					from: '"React-pizza" <diepioRegistarion@yandex.ru>',
					to: user.email,
					subject: "Здравствуйте, вы сделали в нашем ресторане заказ!",
					text: `Здравствуйте! Спасибо что выбрали нас, номер вашего заказа ${uniqueOrderNumber}. Вы можете посмотреть статуст вашего заказа по ссылке https://tomcat-darling-infinitely.ngrok-free.app/order/${uniqueOrderNumber}`
				}
				nodemailer.sendMail(mailOptions, (error, info) => {
					if (error) console.log(error);
					else console.log("Email sent: " + info.response);
				});
			}
			
			return res.json({message: uniqueOrderNumber})
		}catch (e) {
			console.log(e);
			return next(ApiError.internal(e.message));
		}
	}
	
	async getAll (req, res, next){
		try {
			const { id } = req.query;
			
			if(req.phone){
				if(id){
					const orders = await Orders.findAll({
						where: {
							phone: req.phone,
							id: id
						},
						order: [['createdAt', 'DESC']]
					});
					return res.json({message: orders});
				} else {
					const orders = await Orders.findAll({
						where: {
							phone: req.phone
						},
						order: [['createdAt', 'DESC']]
					});
					return res.json({message: orders});
				}
			} else {
				if(id){
					const orders = await Orders.findAll({
						where: {
							userId: req.userId,
							id: id
						},
						order: [['createdAt', 'DESC']]
					});
					return res.json({message: orders});
				} else {
					const orders = await Orders.findAll({
						where: {
							userId: req.userId
						},
						order: [['createdAt', 'DESC']]
					});
					return res.json({message: orders});
				}
			}
			
			
			
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	
	async search (req, res, next){
		try {
			const { nomer } = req.query;
			if ( !nomer ) return next(ApiError.badRequest('Нет данных'));
			
			const order = await Orders.findOne({where: {
					nomer: nomer,
				},
				order: [["id", "DESC"]]
			})
			return res.json({message: order})

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
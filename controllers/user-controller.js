const ApiError = require('../error/ApiError')
const { Users, Orders} = require('../models/models')
const bcrypt = require('bcrypt')
const generateJwt = require('../utilities/generateJwt')
const generateCode = require('../utilities/generateCode')
const nodemailer = require('../utilities/nodemailer')
const enteredUsers = [];
class UserController {
	
	async login (req, res, next) {
		try {
			
			
			const { email, code } = req.body;
			
			if(email && !code){
				const user = await Users.findOrCreate({
					where: { email: email }
				})
				sendMail(user);
			}

			if(code && email){
				
				const findUserWithCode = enteredUsers.find(user => user.code === Number(code) &&  user.user[0].dataValues.email === email);
				if(!findUserWithCode) return next(ApiError.badRequest('Неверный код'));
				const token = generateJwt(findUserWithCode.user[0].dataValues.id);
				return res.json({message: token});
			}

			function sendMail (userDB){
				let randomCode;
    			do {
    			    randomCode = generateCode();
    			} while (enteredUsers.some(user => user.code === randomCode)); 

				let mailOptions = {
					from: '"React-pizza" <diepioRegistarion@yandex.ru>',
					to: email,
					subject: "Ваш код для входа: " + randomCode,
					text: `Здравствуйте, ${userDB.username}. Ваш код для входа: ${randomCode}`
				}
				console.log(randomCode);

				nodemailer.sendMail(mailOptions, (error, info) => {
					if (error) console.log(error);
					else console.log("Email sent: " + info.response);
				});

				enteredUsers.push({user: userDB, code: randomCode})

				return res.json({message: "Ваш код на почте"});
			}
			
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	
	async getInfo (req, res, next) {
		try {
			const user = await Users.findOne({attributes: ["email", "username", "role", "phone"], where: {id: req.userId}})
			
			return res.json({message: user})
			
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	
	async changeUsername (req, res, next) {
		try {
			const { username } = req.body;
			
			if(!username) return next(ApiError.badRequest('Нет данных'));
			
			const update = await Users.update({
				username: username
			}, {
				where: { id: req.userId }
			})

			if(update){
				return res.json({message: ''})

			} else return next(ApiError.badRequest('Ошибка обновления'));
			
			
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	
	async changeEmail (req, res, next) {
		try {
			const { email } = req.body;
			
			if(!email) return next(ApiError.badRequest('Нет данных'));
			
			const update = await Users.update({
				email: email
			}, {
				where: { id: req.userId }
			})
			
			if(update){
				return res.json({message: ''})

			} else return next(ApiError.badRequest('Ошибка обновления'));
			
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	
	async changePhone(req, res, next) {
		try {
			const { phone } = req.body;
	
			if (!phone) return next(ApiError.badRequest('Нет данных'));
	
			const user = await Users.findOne({ where: { id: req.userId } });
			if (!user) return next(ApiError.badRequest('Пользователь не найден'));

			const userPhone = await Users.findOne({ where: { phone: phone } });
		
			if (userPhone && user.phone) return next(ApiError.badRequest(`Этот номер телефона привязан к другой почте (${hideEmail(userPhone.email)}), если вы хотите пользоваться этим номером телефона войдите в другой акканут к которому привязан этот номер телефона!`));
			
			const ordersUserId = await Orders.findAll({ where: { userId: req.userId } });
	
			const promisesOne = ordersUserId.map((orderUserId) => {
				return Orders.update(
					{ userId: null },
					{ where: { id: orderUserId.id } }
				);
			});
	
			const ordersPhone = await Orders.findAll({ where: { phone: phone.slice(1) } });
			const promisesTwo = ordersPhone.map((orderPhone) => {
				return Orders.update(
					{ userId: req.userId },
					{ where: { id: orderPhone.id, userId: null } }
				);
			});
	
			await Promise.all(promisesOne);
			await Promise.all(promisesTwo);
	
			const update = await Users.update(
				{ phone: phone },
				{ where: { id: req.userId } }
			);
	
			if (update) {
				return res.json({ message: 'Номер телефона успешно обновлен' });
			} else {
				return next(ApiError.badRequest('Ошибка обновления'));
			}

			function hideEmail(email) {
				const [user, domain] = email.split('@');
				
				if (user.length <= 4) {
					return `${user[0]}...@${domain}`;
				}
			
				const hiddenPart = user.slice(1, -1); 
				
				const hiddenEmail = `${user[0]}${'.'.repeat(hiddenPart.length)}${user[user.length - 1]}@${domain}`;
			
				return hiddenEmail;
			}
		} catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	
}

module.exports = new UserController();
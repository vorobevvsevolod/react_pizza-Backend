const ApiError = require('../error/ApiError')
const { Users} = require('../models/models')
const bcrypt = require('bcrypt')
const generateJwt = require('../utilities/generateJwt')
const generateCode = require('../utilities/generateCode')
const nodemailer = require('../utilities/nodemailer')
const enteredUsers = [];
class UserController {
	async registration (req, res, next) {
		try{
			const {email, password, username} = req.body
			if(!email ||  !password || !username)  return next(ApiError.badRequest('ошибка регистрации'));
			
			const candidate = await Users.findOne({where: {email: email}})
			if (candidate !== null) return next(ApiError.badRequest('Пользователь уже зарегистрирован'));
			
			const hashPassword = await bcrypt.hash(password, 5);
			const user = await Users.create({email: email, username: username, password: hashPassword})
			const token = generateJwt(user.id);
			
			return res.json({message: token})
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	
	async login (req, res, next) {
		try {
			
			const { email, code } = req.body;
			
			if(email){
				const user = await Users.findOrCreate({
					where: { email: email }
				})
				sendEmail(user);
			}

			if(code){
				const findUserWithCode = enteredUsers.find(user => user.code === Number(code));
				if(!findUserWithCode) return next(ApiError.badRequest('Неверный код'));

				const token = generateJwt(findUserWithCode.user.id);
				return res.json({message: token});
			}

			function sendEmail (userDB){
				const randomCode = generateCode();
				let mailOptions = {
					from: '"React-pizza" <diepioRegistarion@yandex.ru>',
					to: email,
					subject: "Ваш код для входа: " + randomCode,
					text: `Здравствуйте, ${userDB.username}. Ваш код для входа: ${randomCode}`
				}

				nodemailer.sendMail(mailOptions, (error, info) => {
					if (error) console.log(error);
					else console.log("Email sent: " + info.response);
				});

				enteredUsers.push({user: userDB, code: randomCode})

				return res.json({message: "Ваш код на почте )" + randomCode});
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
			const { username } = req.query;
			
			if(!username) return next(ApiError.badRequest('Нет данных'));
			
			const update = await Users.update({
				username: username
			}, {
				where: { id: req.userId }
			})
			
			return res.json({message: update})
			
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	
	async changeEmail (req, res, next) {
		try {
			const { email } = req.query;
			
			if(!email) return next(ApiError.badRequest('Нет данных'));
			
			const update = await Users.update({
				email: email
			}, {
				where: { id: req.userId }
			})
			
			return res.json({message: update})
			
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	
	async changePhone (req, res, next) {
		try {
			const { phone } = req.query;
			console.log(req.userId);
			
			if(!phone) return next(ApiError.badRequest('Нет данных'));
			
			const update = await Users.update({
				phone: phone
			}, {
				where: { id: req.userId }
			})
			
			return res.json({message: update})
			
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
}

module.exports = new UserController();
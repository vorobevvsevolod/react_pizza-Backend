const ApiError = require('../error/ApiError')
const { Users} = require('../models/models')
const bcrypt = require('bcrypt')
const generateJwt = require('../Utilities/generateJwt')
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
			const {email, password} = req.body;
			
			if (!email || !password) return next(ApiError.badRequest('Ошибка нет данных'));
			
			const user = await Users.findOne({
				where: { email: email }
			})
			
			if (!user) return next(ApiError.badRequest('Неверный email или пароль'));
			
			const comparePassword = await bcrypt.compareSync(password, user.password);
			if (!comparePassword) return next(ApiError.badRequest('Неверный email или пароль'));
			
			const token = generateJwt(user.id);
			return res.json({message: token})
			
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
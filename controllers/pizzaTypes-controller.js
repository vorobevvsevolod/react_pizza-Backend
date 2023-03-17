const ApiError = require('../error/ApiError')
const { PizzasTypes } = require('../models/models')

class PizzasTypesController {
	async create (req, res, next){
		try {
			const { name } = req.body;
			if (!name) return next(ApiError.badRequest('Нет данных'));
			
			const type = await PizzasTypes.create({type: name})
			
			return res.json({message: type})
			
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	async getAll (req, res, next){
		try {
			const types = await PizzasTypes.findAll({attributes: ["id", "type"]})
			
			return res.json({message: types})
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	
}

module.exports = new PizzasTypesController();
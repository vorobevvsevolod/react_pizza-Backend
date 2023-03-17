const ApiError = require('../error/ApiError')
const { PizzasSizes} = require('../models/models')

class PizzasSizesController {
	
	async create (req, res, next){
		try {
			const { name } = req.body;
			if (!name) return next(ApiError.badRequest('Нет данных'));
			
			const size = await PizzasSizes.create({size: name})
			
			return res.json({message: size})
			
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	
	async getAll (req, res, next){
		try {
			const sizes = await PizzasSizes.findAll({attributes: ["id", "size", "dopPrice"]})
			
			return res.json({message: sizes})
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	
}

module.exports = new PizzasSizesController();
const ApiError = require('../error/ApiError')
const { PizzasTypes } = require('../models/models')

class PizzasTypesController {
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
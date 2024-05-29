const ApiError = require('../error/ApiError')
const { PizzasSizes} = require('../models/models')

class PizzasSizesController {
	
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
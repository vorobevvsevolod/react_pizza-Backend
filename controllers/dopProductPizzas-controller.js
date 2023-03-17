const ApiError = require('../error/ApiError')
const { DopProductPizza} = require('../models/models')

class dopProductPizzas {
	
	async create (req, res, next){
		try {
			const { dopProductId, pizzaId} = req.body;
			if (!dopProductId || !pizzaId) return next(ApiError.badRequest('Нет данных'));
			
			const dopProductPizza = await DopProductPizza.create({
				dodProductId: dopProductId,
				pizzaId: pizzaId
			})
			
			return res.json({message: dopProductPizza})
			
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	
	// async getAll (req, res, next){
	// 	try {
	// 		const sizes = await DopProductPizza.findAll({attributes: ["id", "size"]})
	//
	// 		return res.json({message: sizes})
	// 	}catch (e) {
	// 		return next(ApiError.internal(e.message));
	// 	}
	// }
	
}

module.exports = new dopProductPizzas();
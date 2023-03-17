const ApiError = require('../error/ApiError')
const { ProductsTypes } = require('../models/models')

class ProductsTypesController {
	
	async create (req, res, next){
		try {
			const { name } = req.body;
			if (!name) return next(ApiError.badRequest('Нет данных'));
			
			const productType = await ProductsTypes.create({name: name})
			
			return res.json({message: productType})
			
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	
	async getAll (req, res, next){
		try {
			const productTypes = await ProductsTypes.findAll({order:[["id", "ASC"]], attributes: ["id", "name"] })
			
			return res.json({message: productTypes})
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	
}

module.exports = new ProductsTypesController();
const ApiError = require('../error/ApiError')
const { ProductsTypes } = require('../models/models')

class ProductsTypesController {

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
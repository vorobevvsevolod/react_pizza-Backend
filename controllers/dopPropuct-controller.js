const ApiError = require('../error/ApiError')
const { DopProduct } = require('../models/models')
const uuid = require("uuid");
const path = require("path");

class DopProductController {
	async getAll (req, res, next){
		try {
			const dopProducts = await DopProduct.findAll({attributes: ["id", "name", "price", "img_url"]})
			return res.json({message: dopProducts})
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	
}

module.exports = new DopProductController();
const ApiError = require('../error/ApiError')
const { DopProduct } = require('../models/models')
const uuid = require("uuid");
const path = require("path");

class DopProductController {
	
	async create (req, res, next){
		try {
			if (!req.files) return next(ApiError.badRequest('Нет изображения'));
			const { img } = req.files;
			
			const { name, price } = req.body;
			if (!name || ! price) return next(ApiError.badRequest('Нет данных'));
			
			let fileName = uuid.v4() + "." + img.mimetype.split('/')[1];
			img.mv(path.resolve(__dirname, '..', 'static/dopProduct', fileName))
			
			const dopProduct = await DopProduct.create({
				name: name,
				price: price,
				img_url: fileName
			})
			
			return res.json({message: dopProduct})
			
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	
	async getAll (req, res, next){
		try {
			const dopProducts = await DopProduct.findAll({attributes: ["id", "name", "price", "img_url"]})
			return res.json({message: dopProducts})
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	
	async getById(req, res, next){
		try {
			const { id } = req.params;
			if(!id) return next(ApiError.badRequest('Нет данных'));
			const dopProduct = await DopProduct.findAll({
				attributes: ["id", "name", "price", "img_url"],
				where: {id: id}
			})
			
			return res.json({message: dopProduct})
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	
}

module.exports = new DopProductController();
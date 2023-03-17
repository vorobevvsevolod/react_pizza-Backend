const ApiError = require('../error/ApiError')
const { Products, PizzaInfo, PizzasTypesVariants, PizzasSizesVariants, DopProductPizza} = require('../models/models')
const uuid = require('uuid')
const path = require('path')
class ProductsController {
	async create (req, res, next){
		try {
			if (!req.files) return next(ApiError.badRequest('Нет изображения'));
			const { img } = req.files;
			const {name, price, description, typeId } = req.body;
			
			
			if (!name || !price || !typeId)
				return next(ApiError.badRequest('Нет данных'));
			
			let fileName = uuid.v4() + "." + img.mimetype.split('/')[1];
			
			
			
			if(typeId === 1){
				img.mv(path.resolve(__dirname, '..', 'static/product', fileName));
				const product = await Products.create({
					name: name,
					price: price,
					img_url: fileName,
					description: description,
					productsTypeId: typeId
				})
				return res.json({message: product})
			}
			
			const { calories, squirrels, fats, carbohydrates, weight } = req.body;
			// switch (typeId){
			// 	case 1:  break;
			// 	case 2:  break;
			// }
			//
			img.mv(path.resolve(__dirname, '..', 'static/snacks', fileName));
			
			const productInfo = await PizzaInfo.create({
				description: description,
				calories: calories,
				squirrels: squirrels,
				fats: fats,
				carbohydrates: carbohydrates,
				weight: weight
			})
				
			const product = await Products.create({
				name: name,
				price: price,
				img_url: fileName,
				description: description,
				productsTypeId: typeId,
				pizzaInfoId: productInfo.id
			})
			return res.json({message: product})
			
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	async createPizzaType (req, res, next){
		try {
			if (!req.files) return next(ApiError.badRequest('Нет изображения'));
			const { img } = req.files;
			
			const { price, sizeId, typeId, pizzaId, descriptionInfo, calories, squirrels, fats, carbohydrates, weight} = req.body;
			if (!price || !sizeId || !typeId || !descriptionInfo || !calories || !squirrels || !fats || !carbohydrates || !weight || !pizzaId)
				return next(ApiError.badRequest('Нет данных'));
			let fileName = uuid.v4() + "." + img.mimetype.split('/')[1];
			img.mv(path.resolve(__dirname, '..', 'static/product', fileName))
			
			const pizzasInfo = await PizzaInfo.create({
				description: descriptionInfo,
				calories: calories,
				squirrels: squirrels,
				fats: fats,
				carbohydrates: carbohydrates,
				weight: weight
			})
			
			const pizzaType = await PizzasTypesVariants.create({
				price: price,
				pizzaInfoId: pizzasInfo.id,
				pizzasTypeId: typeId,
				img_url: fileName
			})
			
			const pizzaSize = await PizzasSizesVariants.create({
				pizzaId: pizzaId,
				pizzasTypesVariantId: pizzaType.id,
				pizzasSizeId: sizeId
			})
			return res.json({message: `Вы успешно создали новый тип пиццы`})
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	async getAll(req, res, next) {
		try {
			let { typeId, limit, offset, isCount } = req.query;
			
			if(!offset && !limit) {
				offset = 0;
				limit = 4;
			}
			let count = null;
			
			if(isCount) count = await Products.count({ where: { productsTypeId: typeId } });
			
			
			if(Number(typeId) === 1){
				const pizzas = await Products.findAll({
					attributes: ["id", "name", "price", "img_url", "description", "productsTypeId"],
					where:{productsTypeId: typeId},
					order: [["id", "asc"]],
					offset: offset,
					limit: limit,
					include: [
						{
							model: PizzasSizesVariants,
							attributes: ["id", "pizzasSizeId"],
							as: "pizzas_sizes_variants",
							include: [
								{
									model: PizzasTypesVariants,
									attributes: ["id", "pizzasTypeId", "price", "img_url"],
									as: "pizzas_types_variant",
									include: [
										{
											model: PizzaInfo,
											as: "pizza_info"
										}
									]
								}
							]
						},
						{
							model: DopProductPizza,
							attributes: ["dodProductId"],
							as: "dop_product_pizzas"
						}
					]
				});
				
				// Группируем элементы массива pizzas_sizes_variants по значению pizzasSizeId
				const pizzasWithGroupedSizes = pizzas.map(pizza => {
					const sizesGroupedById = pizza.pizzas_sizes_variants.reduce((acc, size) => {
						const { pizzasSizeId } = size;
						if (!acc[pizzasSizeId]) {
							acc[pizzasSizeId] = [];
						}
						acc[pizzasSizeId].push(size);
						return acc;
					}, {});
					
					const steppedSizes = Object.values(sizesGroupedById);
					const array = [];
					pizza.dop_product_pizzas.map(item => array.push(item.dodProductId))
					return {
						...pizza.toJSON(),
						pizzas_sizes_variants: steppedSizes,
						dop_product_pizzas: array
					};
				});
				
				return res.json({ message: {products: pizzasWithGroupedSizes, count: count} });
			}
			
			const products = await Products.findAll({
				attributes: ["id", "name", "price", "img_url","description", "productsTypeId"],
				offset: offset,
				limit: limit,
				where:{productsTypeId: typeId},
				include: [
					{
						model: PizzaInfo,
						as: "pizza_info"
					}
				]
			})
			
			return res.json({ message: {products: products, count: count} });
			
		} catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	
	async getById (req, res, next){
		try {
			const { id } = req.params
			const pizza = await Products.findOne({
				attributes: ["id", "name", "price", "img_url", "pizzasSizeId", "pizzasTypeId", "pizzaInfoId","description"],
				include: [
					{
						model: PizzaInfo,
						attributes: ["description", "calories", "squirrels", "fats", "carbohydrates", "weight"],
						as: "pizzaInfo",
					}
				],
				where: {id: id}
			});
			
			return res.json({message: {
					id: pizza.id,
					name: pizza.name,
					price: pizza.price,
					img_url: pizza.img_url,
					sizeId: pizza.pizzasSizeId,
					typeId:  pizza.pizzasTypeId,
					info: pizza.pizzaInfo
				}})
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	
}

module.exports = new ProductsController();
const ApiError = require('../error/ApiError')
const { Products, PizzaInfo, PizzasTypesVariants, PizzasSizesVariants, DopProductPizza} = require('../models/models')
const uuid = require('uuid')
const path = require('path')
const {where, Op} = require("sequelize");
class ProductsController {
	async getAll(req, res, next) {
		try {
			let { typeId, limit, offset, isCount, search } = req.query;
			
			if(!offset && !limit) {
				offset = 0;
				limit = 4;
			}
			if(!search) search = "";
			let count = null;
			
			if(isCount) count = await Products.count({ where: { productsTypeId: typeId,
					name: {
						[Op.iLike]: '%' + search + '%'
					}
				}
			});
			
			
			if(Number(typeId) === 1){
				const pizzas = await Products.findAll({
					attributes: ["id", "name", "price", "img_url", "description", "productsTypeId"],
					where:{productsTypeId: typeId,
						name: {
							[Op.iLike]: '%' + search + '%'
						}
					},
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
				where:{productsTypeId: typeId,
					name: {
						[Op.iLike]: '%' + search + '%'
					}},
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
	
}

module.exports = new ProductsController();
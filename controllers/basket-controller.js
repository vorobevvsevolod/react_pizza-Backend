const ApiError = require('../error/ApiError')
const { Basket, PizzasSizesVariants, PizzasTypesVariants, BasketPizzaDopProduct, Products, PizzasSizes, DopProduct
} = require('../models/models')
class BasketController {
	async add (req, res, next) {
		try{
			const { pizzasSizedId, description, dopProducts, productId } = req.body;
			
			if( !description) return next(ApiError.badRequest('Нет данных'));
			if(productId){
				
				const basket = await Basket.create({
					productId: productId,
					description: description,
					userId: req.userId,
				})
				return res.json({message: basket.id})
				
			} else {
				
				const basket = await Basket.create({
					pizzasSizesVariantId: pizzasSizedId,
					description: description,
					userId: req.userId,
				} )
				const promises = dopProducts.map((dopProduct) => {
					const dopPr = BasketPizzaDopProduct.create({
						dodProductId: dopProduct,
						basketId: basket.id,
					});
					return dopPr;
				});
				const result = await Promise.all(promises)
				return res.json({message: basket.id})
				
			}
			
		}catch (e) {
			console.log(e)
			return next(ApiError.internal(e.message));
		}
	}
	async getAll (req, res, next) {
		try {
			
			const baskets = await Basket.findAll({
				attributes: ["id", "quantity", "description", "productId"],
				where: { userId: req.userId},
				include:[
					{
						model: PizzasSizesVariants,
						attributes:["id"],
						as: "pizzas_sizes_variant",
						include: [
							{
								model: PizzasTypesVariants,
								attributes:["price", "img_url"],
								as: "pizzas_types_variant"
							},
							{
								model: Products,
								attributes: ["description", "name"],
								as: "product"
							},
							{
								model: PizzasSizes,
								attributes: ["dopPrice"],
								as: "pizzas_size"
							}
						],
					},
					{
						model: Products,
						attributes: ["description", "name", "price", "img_url"],
						as: "product"
					},
				]
			})
			
			const newBaskets = await Promise.all(baskets.map(async (item) => {
				let newItem;
				if(item.productId){
					newItem = {
						id: item.id,
						quantity: item.quantity,
						composition: item.product.description,
						
						description: item.description,
						name: item.product.name,
						img_url: item.product.img_url,
						price:  item.product.price,
					};
				}else{
					const dopProducts = await BasketPizzaDopProduct.findAll({
						where: { basketId: item.id },
						attributes: ["id"],
						include:[
							{
								model: DopProduct,
								attributes:["id", "price"],
								as: "dod_product"
							}
						]
					});
					const price = dopProducts.reduce((sum, obj) => sum + obj.dod_product.price + item.pizzas_sizes_variant.pizzas_size.dopPrice,0)
					const newDopProducts = [];
					dopProducts.map( item => newDopProducts.push(item.dod_product.id))
					
					newItem = {
						id: item.id,
						quantity: item.quantity,
						description: item.description,
						composition: item.pizzas_sizes_variant.product.description,
						name: item.pizzas_sizes_variant.product.name,
						dopProducts: newDopProducts,
						img_url: item.pizzas_sizes_variant.pizzas_types_variant.img_url,
						price: price + item.pizzas_sizes_variant.pizzas_types_variant.price,
						dopPrice: item.pizzas_sizes_variant.pizzas_size.dopPrice
					};
				}
				
				
				return newItem;
			}));
			return res.json({message: newBaskets})
			
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	async updateQuantity (req, res, next) {
		try {
			const { id, quantity } = req.query;
			
			if(!id || !quantity) return next(ApiError.badRequest('Нет данных'));
			
			const update = await Basket.update({
				quantity: quantity
			}, {
				where: { id: id }
			})
		
			return res.json({message: update})
			
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	async delete (req, res, next) {
		try {
			const { id } = req.params;
			if ( !id ) return next(ApiError.badRequest('Нет данных'));
			
			const deleteDopProducts = await BasketPizzaDopProduct.destroy({where: { basketId: id }})
			const deleteItem = await Basket.destroy({where: { id: id}})
			
			return res.json({message: deleteItem})
			
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	
	async deleteDopProduct (req, res, next) {
		try {
			const { basketId, dopProductId } = req.query;
			if ( !basketId || !dopProductId) return next(ApiError.badRequest('Нет данных'));
			
			const deleteDopProduct = await BasketPizzaDopProduct.destroy({
				where: {
					basketId: basketId,
					dodProductId: dopProductId
				}
			})
			
			return res.json({message: deleteDopProduct})
			
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
}

module.exports = new BasketController();
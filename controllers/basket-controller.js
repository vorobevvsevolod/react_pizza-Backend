const ApiError = require('../error/ApiError')
const { Basket, PizzasSizesVariants, PizzasTypesVariants, BasketPizzaDopProduct, Products, PizzasSizes, DopProduct, BasketCombo, Combo, PizzaCombo
} = require('../models/models')

class BasketController {
	async add (req, res, next) {
		try{
			const { pizzasSizedId, description, dopProducts, productId, basketCombos, comboId } = req.body;
			
			if( !description, !req.userId) return next(ApiError.badRequest('Нет данных'));
			if(basketCombos && basketCombos.length){
				const basket = await Basket.create({
					description: description,
					userId: req.userId,
				})

				if( !comboId) return next(ApiError.badRequest('Нет данных'));

				const promises = basketCombos.map((basketCombo) => {
					if(basketCombo.productId){
						const basketCom = BasketCombo.create({
							basketId: basket.id,
							productId:basketCombo.productId,
							comboId: comboId
						});
						return basketCom;
					}else{
						const basketCom = BasketCombo.create({
							basketId: basket.id,
							pizzasSizesVariantId: basketCombo.pizzasSizesVariantId,
							comboId: comboId
						});
						return basketCom;
					}
					
				});

				const result = await Promise.all(promises)

				return res.json({message: basket.id})
			} else {
				if(productId){
				
					const basket = await Basket.create({
						productId: productId,
						description: description,
						userId: req.userId,
					})
					return res.json({message: basket.id})
					
				} else {
					if( !pizzasSizedId) return next(ApiError.badRequest('Нет данных'));

					const basket = await Basket.create({
						pizzasSizesVariantId: pizzasSizedId,
						description: description,
						userId: req.userId,
					} )
					if(dopProducts){
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
					
					return res.json({message: basket.id})
				}
			}

			


			
		}catch (e) {
			console.log(e)
			return next(ApiError.internal(e.message));
		}
	}
	async getAll (req, res, next) {
		try {
			
			const baskets = await Basket.findAll({
				attributes: ["id", "quantity", "description", "productId", "pizzasSizesVariantId"],
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

			if(!item.productId && !item.pizzasSizesVariantId){

				const productCombo = await BasketCombo.findAll({where: {basketId: item.id}})
				const ComboInfo = await Combo.findOne({where: {id: productCombo[0].dataValues.comboId}})

				const increasePromises = productCombo.map(async pr => {
					if (pr.pizzasSizesVariantId) {
						const PizzasS = await PizzasSizesVariants.findOne({ where: { id: pr.pizzasSizesVariantId } });
						const pizzaC = await PizzaCombo.findOne({ where: { productId: PizzasS.productId,comboId: ComboInfo.id } });
				
						return pizzaC.increase;
					}
				
					if (pr.productId) {
						const pizzaC = await PizzaCombo.findOne({ where: { productId: pr.productId,comboId: ComboInfo.id  } });
						return pizzaC.increase;
					}
				
					return 0; 
				});
				
				const increases = await Promise.all(increasePromises);
				
				const totalIncrease = increases.reduce((acc, curr) => acc + curr, 0);

				console.log(increases, totalIncrease)

				return {
					id: item.id,
					pizzasSizedId: '',
					quantity: item.quantity,
					description: '',
					composition: item.description,
					name: 'Комбо '+ ComboInfo.name,
					dopProducts: '',
					img_url: ComboInfo.img_url,
					price:  totalIncrease + ComboInfo.price,
				};

			} else if(item.productId){
					newItem = {
						id: item.id,
						quantity: item.quantity,
						composition: item.product.description,
						productId: item.productId,
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
						pizzasSizedId: item.pizzasSizesVariantId,
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
		
			if(update){
				return res.json({message: ''})
	
			} else return next(ApiError.badRequest('Ошибка обновления'));
			
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	async delete (req, res, next) {
		try {
			const { id } = req.params;
			if ( !id ) return next(ApiError.badRequest('Нет данных'));
			
			const deleteDopProducts = await BasketPizzaDopProduct.destroy({where: { basketId: id }})
			const deleteComboProdutcs= await BasketCombo.destroy({where: { basketId: id}})
			const deleteItem = await Basket.destroy({where: { id: id}})
			
			
			if(deleteItem){
				return res.json({message: ''})
	
			} else return next(ApiError.badRequest('Ошибка удаление'));
			
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	
	async deleteDopProduct (req, res, next) {
		try {
			const { basketId, dopProductId } = req.body;
			if ( !basketId || !dopProductId) return next(ApiError.badRequest('Нет данных'));
			
			const deleteDopProduct = await BasketPizzaDopProduct.destroy({
				where: {
					basketId: basketId,
					dodProductId: dopProductId
				}
			})
			
			if(deleteDopProduct){
				return res.json({message: ''})
	
			} else return next(ApiError.badRequest('Ошибка удаление'));
			
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}

	async clearCart(req, res, next) {
		try {
			if (!req.userId) return next(ApiError.badRequest('Пользователь не найден'));
	
			const baskets = await Basket.findAll({ where: { userId: req.userId } });

			if(!baskets) return next(ApiError.badRequest('Корзина пуста!'));
	
			await Promise.all(baskets.map(async (basket) => {
				const deleteDopProducts = await BasketPizzaDopProduct.destroy({ where: { basketId: basket.id } });
				if(!basket.pizzasSizesVariantId && !basket.productId){
					const deleteDopProducts = await BasketCombo.destroy({ where: { basketId: basket.id } });
				}
			}));
	
			await Basket.destroy({
				where: {
					userId: req.userId,
				},
			});


	
			return res.json({ message: 'Корзина очищена!' });
	
		} catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	
}

module.exports = new BasketController();
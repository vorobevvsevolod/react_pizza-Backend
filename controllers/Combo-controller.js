const ApiError = require('../error/ApiError')
const { Combo, PizzaCombo, ComboDefault, Products, PizzaInfo, PizzasSizesVariants, PizzasTypesVariants, DopProductPizza} = require('../models/models')
const { Op} = require("sequelize");

class ComboController {

	async getAll (req, res, next){
		try {
			
			const Combos = await Combo.findAll();


			const CombosInfos = await Promise.all(Combos.map(async (combo) => {

				const CombosProduct = await PizzaCombo.findAll({where: {comboId: combo.id}, order: [["increase", "asc"]], attributes: ["id", "increase", "productId", "pizzasSizeId"]});
				const CombosProductDefault = await ComboDefault.findAll({where: {comboId: combo.id}, attributes: ["id", "productId", "pizzasSizesVariantId", "productsTypeId"], order: [["productsTypeId", "asc"]]});

				const CombosProductAll = await Promise.all(CombosProductDefault.map(async (comboProductDefault) => {

					if(Number(comboProductDefault.productsTypeId) === 1){

						const pizzas =  await Promise.all(CombosProduct.map(async (comboProduct) => {
							if(comboProduct.pizzasSizeId){
								const product =  await Products.findOne({
									attributes: ["id", "name", "price", "img_url", "description", "productsTypeId"],
									where:{productsTypeId: comboProductDefault.productsTypeId, id: comboProduct.productId},
									order: [["id", "asc"]],
									include: [
										{
											model: PizzasSizesVariants,
											attributes: ["id", "pizzasSizeId"],
											where: {pizzasSizeId: comboProduct.pizzasSizeId},
											order: [["id", "asc"]],
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
									]
								});
								
								return {
									increase: comboProduct.increase,
									...product.dataValues
								};
							}
							
						}));

						const array = pizzas.filter(p => p !== undefined).map(pizza => {
							const sizesGroupedById = pizza.pizzas_sizes_variants.reduce((acc, size) => {
								const { pizzasSizeId } = size;
								if (!acc[pizzasSizeId]) {
									acc[pizzasSizeId] = [];
								}
								acc[pizzasSizeId].push(size);
								return acc;
							}, {});
							
							const steppedSizes = Object.values(sizesGroupedById);
							return {
								...pizza,
								pizzas_sizes_variants: steppedSizes,
							};
						});


						return {
							productsTypeId: comboProductDefault.productsTypeId,
							array: array
						}

					} else {
						const products =  await Promise.all(CombosProduct.map(async (comboProduct) => {

							if(!comboProduct.pizzasSizeId) {
								const productIf = await Products.findOne({
						
									attributes: ["id", "name", "price", "img_url","description", "productsTypeId"],
									where:{ id: comboProduct.productId},
								})

								if(productIf.productsTypeId === comboProductDefault.productsTypeId){
									const product = await Products.findOne({
						
										attributes: ["id", "name", "price", "img_url","description", "productsTypeId"],
										where:{productsTypeId: comboProductDefault.productsTypeId, id: comboProduct.productId},
										include: [
											{
												model: PizzaInfo,
												as: "pizza_info"
											}
										]
									})
				
									return {
										increase: comboProduct.increase,
										...product.dataValues
									};
								}
							}
						}));

						return {
							productsTypeId: comboProductDefault.productsTypeId,
							array: products.filter(p => p !== undefined)
						};
						
					}

				}));
				
				const uniqueProducts = CombosProductAll.reduce((acc, current) => {
					const isExisting = acc.some(item => item.productsTypeId === current.productsTypeId);
				
					if (!isExisting) {
						acc.push(current);
					}
				
					return acc;
				}, []);
				

				return{
					id: combo.id,
					title: combo.name,
					description: combo.description,
					priceDefault: combo.price,
					img_url: combo.img_url,
					products: uniqueProducts,
					productDefault: CombosProductDefault
				}
			}));

			
			

			return res.json({message: CombosInfos})
			
		}catch (e) {
			return next(ApiError.internal(e.message));
		}
	}
	
	
}

module.exports = new ComboController();
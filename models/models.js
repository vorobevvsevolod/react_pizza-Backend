const Users = require('./Users-model');
const Basket = require("./Basket-model");
const BasketPizzaDopProduct = require("./BasketPizzaDopProduct-model");
const DopProduct = require("./DopProduct-model");
const DopProductPizza = require("./DopProductPizza-model");
const PizzaInfo = require("./PizzaInfo-model");
const PizzasSizes = require("./PizzasSizes-model");
const PizzasTypes = require("./PizzasTypes-model");
const Orders = require("./Orders-model");
const OrderStatus = require("./OrdersStatus-model");
const OrderProduct = require("./OrderProduct-model");
const Products = require("./Products-model");
const ProductsTypes = require('./ProductsTypes')
const PizzasSizesVariants = require("./PizzasSizesVariants-model");
const PizzasTypesVariants = require("./PizzasTypesVariants-model");
const Combo = require("./Combo-model");
const PizzaCombo = require("./PizzaCombo-model");
const ComboDefault = require("./ComboDefault-model");
const BasketCombo = require("./BasketCombo-model");


Users.hasMany(Orders);
Orders.belongsTo(Users);


/////////////////////-----PizzasSizesVariants

Products.hasMany(PizzasSizesVariants)
PizzasSizesVariants.belongsTo(Products)

PizzasTypesVariants.hasOne(PizzasSizesVariants)
PizzasSizesVariants.belongsTo(PizzasTypesVariants)

PizzasSizes.hasMany(PizzasSizesVariants)
PizzasSizesVariants.belongsTo(PizzasSizes)

ProductsTypes.hasMany(Products)
Products.belongsTo(ProductsTypes)

PizzaInfo.hasMany(Products)
Products.belongsTo(PizzaInfo)



///////////////---PizzasTypesVariants

PizzaInfo.hasOne(PizzasTypesVariants)
PizzasTypesVariants.belongsTo(PizzaInfo)

PizzasTypes.hasMany(PizzasTypesVariants)
PizzasTypesVariants.belongsTo(PizzasTypes)

////////////////////-BasketPIzza
PizzasSizesVariants.hasMany(Basket)
Basket.belongsTo(PizzasSizesVariants)

Users.hasMany(Basket);
Basket.belongsTo(Users);

Products.hasMany(Basket);
Basket.belongsTo(Products);

/////////---OrderProduct

Orders.hasMany(OrderProduct);
OrderProduct.belongsTo(Orders);

OrderStatus.hasMany(Orders);
Orders.belongsTo(OrderStatus)


PizzasSizesVariants.hasMany(OrderProduct)
OrderProduct.belongsTo(PizzasSizesVariants)

Products.hasMany(OrderProduct)
OrderProduct.belongsTo(Products)

////////---DopProductPizza

DopProduct.hasMany(DopProductPizza)
DopProductPizza.belongsTo(DopProduct)

Products.hasMany(DopProductPizza)
DopProductPizza.belongsTo(Products)



DopProduct.hasMany(BasketPizzaDopProduct)
BasketPizzaDopProduct.belongsTo(DopProduct)

Basket.hasMany(BasketPizzaDopProduct)
BasketPizzaDopProduct.belongsTo(Basket)


//////---PizzaCombo

PizzasSizes.hasMany(PizzaCombo)
PizzaCombo.belongsTo(PizzasSizes)

Products.hasMany(PizzaCombo);
PizzaCombo.belongsTo(Products);

Combo.hasMany(PizzaCombo);
PizzaCombo.belongsTo(Combo);

//////---ComboDefault
PizzasSizesVariants.hasMany(ComboDefault)
ComboDefault.belongsTo(PizzasSizesVariants)

Products.hasMany(ComboDefault);
ComboDefault.belongsTo(Products);

Combo.hasMany(ComboDefault);
ComboDefault.belongsTo(Combo);

ProductsTypes.hasMany(ComboDefault);
ComboDefault.belongsTo(ProductsTypes);




//////---BasketCombo

Products.hasMany(BasketCombo);
BasketCombo.belongsTo(Products);

PizzasSizesVariants.hasMany(BasketCombo)
BasketCombo.belongsTo(PizzasSizesVariants)

Combo.hasMany(BasketCombo);
BasketCombo.belongsTo(Combo);

Basket.hasMany(BasketCombo);
BasketCombo.belongsTo(Basket);

module.exports ={
	Users,
	Basket,
	BasketPizzaDopProduct,
	DopProduct,
	DopProductPizza,
	PizzaInfo,
	PizzasSizes,
	PizzasTypes,
	Orders,
	OrderProduct,
	Products,
	PizzasSizesVariants,
	PizzasTypesVariants,
	ProductsTypes,
	OrderStatus,
	Combo,
	PizzaCombo,
	ComboDefault,
	BasketCombo
}
const Router = require('express');
const router = new Router();
const userRouter = require('./user-router')
const sizesRouter = require('./pizzaSizes-router')
const typesRouter = require('./pizzaTypes-router')
const pizzasRouter = require('./pizzas-router')
const dopProductRouter = require('./dopProduct-router')
const dopProductPizzasRouter = require('./dopProductPizzas-router')
const BasketPizzaRouter = require('./basketPizza-router')
const ProductTypesRouter = require('./productsTypes-router')
const OrdersRouter = require('./orders-router')
const ComboRouter = require('./Combo-router')

router.use('/user', userRouter)
router.use('/types', typesRouter)
router.use('/sizes', sizesRouter)
router.use('/products', pizzasRouter)
router.use('/dopproduct', dopProductRouter)
router.use('/dopproductpizza', dopProductPizzasRouter)
router.use('/basketpizza', BasketPizzaRouter)
router.use('/productstypes', ProductTypesRouter)
router.use('/orders', OrdersRouter)
router.use('/combo', ComboRouter)


module.exports = router
const Router = require('express');
const router = new Router();
const ProductsController = require('../controllers/products-controller')

router.post('/', ProductsController.create)
router.post('/type', ProductsController.createPizzaType)

router.get('/', ProductsController.getAll)


module.exports = router
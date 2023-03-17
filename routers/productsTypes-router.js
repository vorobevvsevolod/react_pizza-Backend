const Router = require('express');
const router = new Router();
const ProductsTypesController = require('../controllers/productsTypes-controller')

router.post('/', ProductsTypesController.create)

router.get('/', ProductsTypesController.getAll)

module.exports = router
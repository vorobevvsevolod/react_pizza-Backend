 const Router = require('express');
const router = new Router();
const DopProductPizzasController = require('../controllers/dopProductPizzas-controller')

router.post('/', DopProductPizzasController.create)

module.exports = router
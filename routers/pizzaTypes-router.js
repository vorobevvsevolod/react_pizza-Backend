const Router = require('express');
const router = new Router();
const TypesController = require('../controllers/pizzaTypes-controller')
router.post('/', TypesController.create)

router.get('/', TypesController.getAll)

module.exports = router
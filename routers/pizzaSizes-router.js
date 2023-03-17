const Router = require('express');
const router = new Router();
const SizesController = require('../controllers/pizzaSizes-controller')
router.post('/', SizesController.create)

router.get('/', SizesController.getAll)

module.exports = router
const Router = require('express');
const router = new Router();
const ComboController = require('../controllers/Combo-controller')

router.get('/', ComboController.getAll);

module.exports = router
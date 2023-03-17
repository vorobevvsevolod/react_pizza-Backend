const Router = require('express');
const router = new Router();
const DopProductController = require('../controllers/dopPropuct-controller')
router.post('/', DopProductController.create)

router.get('/', DopProductController.getAll)
router.get('/:id', DopProductController.getById)

module.exports = router
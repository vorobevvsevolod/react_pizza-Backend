const Router = require('express');
const router = new Router();
const OrdersController = require('../controllers/orders-controller')
const AuthorizationMiddleware = require('../middleware/authorizationMiddleware')



router.post('/', AuthorizationMiddleware, OrdersController.create)
router.get('/', AuthorizationMiddleware, OrdersController.getAll)
router.get('/search', OrdersController.search)
router.get('/status', OrdersController.getStatus)
router.get('/:id', OrdersController.getByIdWithPhoneOrToken)




module.exports = router
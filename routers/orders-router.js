const Router = require('express');
const router = new Router();
const OrdersController = require('../controllers/orders-controller')
const AuthorizationMiddleware = require('../middleware/authorizationMiddleware')

router.post('/', AuthorizationMiddleware, OrdersController.create)
router.get('/', AuthorizationMiddleware, OrdersController.getAll)

//router.get('/:id', UserController.registration)




module.exports = router
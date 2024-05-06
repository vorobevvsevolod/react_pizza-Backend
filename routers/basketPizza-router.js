const Router = require('express');
const router = new Router();
const BasketPizzaController = require('../controllers/basket-controller')
const AuthorizationMiddleware = require('../middleware/authorizationMiddleware')
router.get('/', AuthorizationMiddleware, BasketPizzaController.getAll)

router.post('/', AuthorizationMiddleware, BasketPizzaController.add)

router.put('/update', AuthorizationMiddleware, BasketPizzaController.updateQuantity)

router.delete('/:id', AuthorizationMiddleware, BasketPizzaController.delete)

router.post('/dopproduct', AuthorizationMiddleware, BasketPizzaController.deleteDopProduct)

router.get('/clear', AuthorizationMiddleware, BasketPizzaController.clearCart)

module.exports = router

const Router = require('express');
const router = new Router();
const OrdersController = require('../controllers/orders-controller')
const AuthorizationMiddleware = require('../middleware/authorizationMiddleware')

const ApiError = require('../error/ApiError')
const { check, validationResult } = require('express-validator');

router.post('/',
AuthorizationMiddleware,
    [
    check('address')
      .isLength({ min: 1, max: 70 }).withMessage('Длина адресса должна быть от 1 до 70 символов')
      .matches(/^[а-яА-ЯёЁ0-9\s,.:;-]+$/g).withMessage('Адресс должен содержать только русские символы и цифры')
      .escape(),
    check('phone')
      .not().isEmpty().withMessage('Номер телефона не должен быть пустым')
      .isLength({ min: 10, max: 15 }).withMessage('Номер телефона должен содержать от 10 до 15 символов')
      .matches(/^\+?[0-9]*$/).withMessage('Номер телефона должен содержать только цифры и может начинаться с +')
      .trim().escape(),
    check('products').isArray().withMessage('Products должен быть массивом'),

  ], async (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        
        const errorMessages = errors.array().map(error => error.msg);

        return next(ApiError.badRequest('Ошибка валлидации ' + errorMessages));
      }
      
    
      OrdersController.create(req, res, next);
});
  
router.get('/', AuthorizationMiddleware, OrdersController.getAll)

router.get('/search',
    [
    check('nomer')
      .not().isEmpty().withMessage('Номер заказа не должен быть пустым')
      .isLength({ min: 10, max: 20 }).withMessage('Номер телефона должен содержать от 10 до 15 символов')
      .matches(/^[a-zA-Z0-9./-]+$/).withMessage('Новер заказа содержит только буквы и числа ')
      .trim().escape(),
  ], async (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        
        const errorMessages = errors.array().map(error => error.msg);

        return next(ApiError.validationError('Ошибка валлидации ' + errorMessages));
      }
      
    
      OrdersController.search(req, res, next);
});
router.get('/status', OrdersController.getStatus)




module.exports = router
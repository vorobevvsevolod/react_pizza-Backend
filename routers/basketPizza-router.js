const Router = require('express');
const router = new Router();
const BasketPizzaController = require('../controllers/basket-controller')
const AuthorizationMiddleware = require('../middleware/authorizationMiddleware')
const ApiError = require('../error/ApiError')
const { check, validationResult } = require('express-validator');
router.get('/', AuthorizationMiddleware, BasketPizzaController.getAll)

router.post('/', AuthorizationMiddleware, [
    check('description')
      .optional()
      .matches(/^[а-яА-ЯёЁ0-9\s,.:;-]+$/g)
      .withMessage('Описание должно содержать только русские символы и цифры')
      .isLength({ max: 255 })
      .withMessage('Длина описания должна быть до 255 символов')
      .escape(),
    check('pizzasSizedId')
      .optional()
      .isNumeric()
      .withMessage('Идентификатор типа должен быть числом')
      .escape(),
    check('productId')
      .optional()
      .isNumeric()
      .withMessage('Идентификатор типа должен быть числом')
      .escape(),
    check('comboId')
      .optional()
      .isNumeric()
      .withMessage('Идентификатор типа должен быть числом')
      .escape(),
    check('dopProducts')
      .optional()
      .isArray()
      .withMessage('DopProducts должен быть массивом'),
    check('basketCombos')
      .optional()
      .isArray()
      .withMessage('BasketCombos должен быть массивом'),
  ], async (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      const errorMessages = errors.array().map(error => error.msg);
      return next(ApiError.validationError('Ошибка валидации ' + errorMessages));
    }
    
    BasketPizzaController.add(req, res, next);
});


router.patch('/update',
AuthorizationMiddleware,
    [
      check('quantity').isNumeric().withMessage('Идентификатор типа должен быть числом').escape(),
      check('id').isNumeric().withMessage('Идентификатор типа должен быть числом').escape(),

  ], async (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        
        const errorMessages = errors.array().map(error => error.msg);

        return next(ApiError.validationError('Ошибка валлидации ' + errorMessages));
      }
      
    
      BasketPizzaController.updateQuantity(req, res, next);
});


router.delete('/:id', AuthorizationMiddleware,
    [
      check('id').isNumeric().withMessage('Идентификатор типа должен быть числом').escape(),
    ], async (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        const errorMessages = errors.array().map(error => error.msg);
        return next(ApiError.validationError('Ошибка валлидации ' + errorMessages));
      }
    
      BasketPizzaController.delete(req, res, next);
});


router.post('/dopproduct', AuthorizationMiddleware,
    [
      check('basketId').isNumeric().withMessage('Идентификатор типа должен быть числом').escape(),
      check('dopProductId').isNumeric().withMessage('Идентификатор типа должен быть числом').escape(),
    ], async (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        const errorMessages = errors.array().map(error => error.msg);
        return next(ApiError.validationError('Ошибка валлидации ' + errorMessages));
      }
    
      BasketPizzaController.deleteDopProduct(req, res, next);
});

router.get('/clear', AuthorizationMiddleware, BasketPizzaController.clearCart)

module.exports = router

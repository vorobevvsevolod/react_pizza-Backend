const Router = require('express');
const router = new Router();
const ProductsController = require('../controllers/products-controller')
const ApiError = require('../error/ApiError')
const { check, validationResult } = require('express-validator');

router.get('/', )

router.get('/',  [
    check('search')
      .optional()
      .matches(/^[а-яА-ЯёЁ0-9\s,.:;-]+$/g)
      .withMessage('Параметр поиска должен содержать только русские символы и цифры')
      .isLength({ max: 255 })
      .withMessage('Длина описания должна быть до 255 символов')
      .escape(),
    check('limit')
      .optional()
      .isNumeric()
      .withMessage('Идентификатор типа должен быть числом')
      .escape(),
    check('offset')
      .optional()
      .isNumeric()
      .withMessage('Идентификатор типа должен быть числом')
      .escape(),
    check('isCount')
      .optional()
      .isBoolean()
      .withMessage('Количество должено быть boolean')
      .escape(),
    check('typeId')
      .optional()
      .isNumeric()
      .withMessage('Идентификатор типа должен быть числом')
      .escape(),
  ], async (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      const errorMessages = errors.array().map(error => error.msg);
      return next(ApiError.validationError('Ошибка валидации ' + errorMessages));
    }
    
    ProductsController.getAll(req, res, next);
});
module.exports = router
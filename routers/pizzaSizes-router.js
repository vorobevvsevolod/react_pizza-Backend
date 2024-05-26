const Router = require('express');
const router = new Router();
const SizesController = require('../controllers/pizzaSizes-controller')
const ApiError = require('../error/ApiError')
const { check, validationResult } = require('express-validator');

router.post('/', [
    check('name')
      .isLength({ min: 1, max: 70 }).withMessage('Длина названия должна быть от 1 до 70 символов')
      .isNumeric()
      .escape()
  ], async (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      const errorMessages = errors.array().map(error => error.msg);
      return next(ApiError.validationError('Ошибка валлидации: ' + errorMessages));
      } 
    
    SizesController.create(req, res, next);
});

router.get('/', SizesController.getAll)

module.exports = router
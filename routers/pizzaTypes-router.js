const Router = require('express');
const router = new Router();
const TypesController = require('../controllers/pizzaTypes-controller')
const ApiError = require('../error/ApiError')
const { check, validationResult } = require('express-validator');

router.post('/', [
    check('name')
      .isLength({ min: 1, max: 70 }).withMessage('Длина названия должна быть от 1 до 70 символов')
      .matches(/^[а-яА-ЯёЁ0-9]+$/).withMessage('Название должно содержать только русские символы и цифры')
      .escape()
  ], async (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      const errorMessages = errors.array().map(error => error.msg);
      return next(ApiError.validationError('Ошибка валлидации: ' + errorMessages));
      } 
    
    TypesController.create(req, res, next);
});

router.get('/', TypesController.getAll)

module.exports = router
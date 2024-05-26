const Router = require('express');
const router = new Router();
const ProductsTypesController = require('../controllers/productsTypes-controller')
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
      
    
    ProductsTypesController.create(req, res, next);
});
  


router.get('/', ProductsTypesController.getAll)

module.exports = router
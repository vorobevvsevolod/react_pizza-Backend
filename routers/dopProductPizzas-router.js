 const Router = require('express');
const router = new Router();
const DopProductPizzasController = require('../controllers/dopProductPizzas-controller')
const ApiError = require('../error/ApiError')
const { check, validationResult } = require('express-validator');

router.post('/', [
    check('dopProductId').isNumeric().withMessage('Идентификатор типа должен быть числом').escape(),
    check('pizzaId').isFloat().withMessage('Калории должны быть числом').escape(),
  ], async (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      const errorMessages = errors.array()
      return next(ApiError.validationError( errorMessages));
      } 
      
    
      DopProductPizzasController.create(req, res, next);
});

module.exports = router
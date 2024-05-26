const Router = require('express');
const router = new Router();
const DopProductController = require('../controllers/dopPropuct-controller')
const ApiError = require('../error/ApiError')
const { check, validationResult } = require('express-validator');

router.post('/', [
    check('name')
      .isLength({ min: 5, max: 70 }).withMessage('Длина названия должна быть от 1 до 70 символов'),
    check('img').custom((value, { req }) => {
      if (!req.files || !req.files.img) {
          throw new Error('Изображение отсутствует');
      }
      const image = req.files.img;
      const allowedTypes = ['image/jpeg', 'image/png', 'image/webp',, 'image/jpg']; 
      if (!allowedTypes.includes(image.mimetype)) {
          throw new Error('Недопустимый тип изображения');
      }
      const maxSize = 10 * 1024 * 1024; 
      if (image.size > maxSize) {
          throw new Error('Размер изображения слишком большой');
      }

        return true;
    }),
    check('price')
      .isNumeric().withMessage('Цена должно быть числом')
      .isLength({ max: 70 }).withMessage('Длина цены должна быть до 70 символов').escape(),
  ], async (req, res, next) => {

    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        
        const errorMessages = errors.array().map(error => error.msg);

        return next(ApiError.validationError('Ошибка валлидации ' + errorMessages));
      }
    
      DopProductController.create.create(req, res, next);
});

router.get('/', DopProductController.getAll)
router.get('/:id',    [
      check('id').isNumeric().withMessage('Идентификатор типа должен быть числом').escape(),
    ], async (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        
        const errorMessages = errors.array().map(error => error.msg);

        return next(ApiError.validationError('Ошибка валлидации ' + errorMessages));
      }
      
    
      DopProductController.getById(req, res, next);
});

module.exports = router
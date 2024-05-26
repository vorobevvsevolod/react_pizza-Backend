const Router = require('express');
const router = new Router();
const ProductsController = require('../controllers/products-controller')
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
    check('description')
      .matches(/^[а-яА-ЯёЁ0-9\s,.:;-]+$/g).withMessage('Описание должно содержать только русские символы и цифры')
      .isLength({ max: 255 }).withMessage('Длина описания должна быть до 255 символов').escape(),
    check('typeId').isNumeric().withMessage('Идентификатор типа должен быть числом').escape(),
    check('calories').isFloat().withMessage('Калории должны быть числом').escape(),
    check('squirrels').isFloat().withMessage('Белки должны быть числом').escape(),
    check('fats').isFloat().withMessage('Жиры должны быть числом').escape(),
    check('carbohydrates').isFloat().withMessage('Углеводы должны быть числом').escape(),
    check('weight').isFloat().withMessage('Вес должен быть числом').escape()
  ], async (req, res, next) => {

    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        
        const errorMessages = errors.array().map(error => error.msg);

        return next(ApiError.validationError('Ошибка валлидации ' + errorMessages));
    }
    
    ProductsController.create(req, res, next);
});

router.post('/type', [
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
      .isLength({ max: 70 }).withMessage('Длина цены должна быть до 70 символов')
      .escape(),
    check('descriptionInfo')
      .matches(/^[а-яА-ЯёЁ0-9\s,.:;-]+$/g).withMessage('Описание должно содержать только русские символы и цифры')
      .isLength({ max: 255 }).withMessage('Длина описания должна быть до 255 символов')
      .escape(),
    check('typeId').isNumeric().withMessage('Идентификатор типа должен быть числом').escape(),
    check('sizeId').isNumeric().withMessage('Идентификатор типа должен быть числом').escape(),
    check('pizzaId').isNumeric().withMessage('Идентификатор типа должен быть числом').escape(),
    check('calories').isFloat().withMessage('Калории должны быть числом').escape(),
    check('squirrels').isFloat().withMessage('Белки должны быть числом').escape(),
    check('fats').isFloat().withMessage('Жиры должны быть числом').escape(),
    check('carbohydrates').isFloat().withMessage('Углеводы должны быть числом').escape(),
    check('weight').isFloat().withMessage('Вес должен быть числом').escape()
  ], async (req, res, next) => {

    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        
        const errorMessages = errors.array().map(error => error.msg);

        return next(ApiError.validationError('Ошибка валлидации ' + errorMessages));
      }
    
    ProductsController.createPizzaType(req, res, next);
});


router.get('/', ProductsController.getAll)

module.exports = router
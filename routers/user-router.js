const Router = require('express');
const router = new Router();
const UserController = require('../controllers/user-controller')
const AuthorizationMiddleware = require('../middleware/authorizationMiddleware')
const ApiError = require('../error/ApiError')
const { check, validationResult } = require('express-validator');


router.post('/login', 
    check('email').isEmail()
        .isLength({ min: 5, max: 70 }).withMessage('Email должен содержать от 5 до 75 символов')
        .withMessage('Введите корректный email').normalizeEmail(),
    check('code').optional().isLength({ min: 6, max: 6 }).withMessage('Размер кода 6 символов').isNumeric().withMessage('Код должен быть числом'), 
async (req, res, next) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    const errorMessages = errors.array().map(error => error.msg);
    return next(ApiError.validationError('Ошибка валлидации: ' + errorMessages));
    }   

  UserController.login(req, res, next);
});

router.get('/me', AuthorizationMiddleware, UserController.getInfo)

router.patch('/username', [
    AuthorizationMiddleware,
    check('username').not().isEmpty().withMessage('Имя пользователя не должно быть пустым')
        .isLength({ min: 5, max: 70 }).withMessage('Имя пользователя содержать от 5 до 75 символов')
      .matches(/^[а-яА-ЯёЁ0-9]+$/).withMessage('Только русские буквы и цифры')
      .trim().escape()
  ], async (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        const errorMessages = errors.array().map(error => error.msg);
        return next(ApiError.validationError('Ошибка обновления имени пользователя: ' + errorMessages));
     }
    
    UserController.changeUsername(req, res, next);
  });

  router.patch('/email', [
    AuthorizationMiddleware,
    check('email').isEmail()
    .isLength({ min: 5, max: 70 }).withMessage('Email должен содержать от 5 до 75 символов')
    .withMessage('Введите корректный email').normalizeEmail()
  ], async (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
         const errorMessages = errors.array().map(error => error.msg);
        return next(ApiError.validationError('Ошибка обновления email: ' + errorMessages));
    }

    
  
    UserController.changeEmail(req, res, next);
  });
  
  router.patch('/phone', [
    AuthorizationMiddleware,
    check('phone')
      .not().isEmpty().withMessage('Номер телефона не должен быть пустым')
      .isLength({ min: 10, max: 15 }).withMessage('Номер телефона должен содержать от 10 до 15 символов')
      .matches(/^\+?[0-9]*$/).withMessage('Номер телефона должен содержать только цифры и может начинаться с +')
      .trim().escape()
  ], async (req, res, next) => {
    const errors = validationResult(req);/^[а-яА-ЯёЁ]+$/
    if (!errors.isEmpty()) {
        const errorMessages = errors.array().map(error => error.msg);
        return next(ApiError.validationError('Ошибка обновления номера телефона: ' + errorMessages));
    }
  
    UserController.changePhone(req, res, next);
  });

module.exports = router
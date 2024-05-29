const Router = require('express');
const router = new Router();
const TypesController = require('../controllers/pizzaTypes-controller')
const ApiError = require('../error/ApiError')
const { check, validationResult } = require('express-validator');

router.get('/', TypesController.getAll)

module.exports = router
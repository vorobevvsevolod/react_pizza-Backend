const Router = require('express');
const router = new Router();
const SizesController = require('../controllers/pizzaSizes-controller')
const ApiError = require('../error/ApiError')
const { check, validationResult } = require('express-validator');

router.get('/', SizesController.getAll)

module.exports = router
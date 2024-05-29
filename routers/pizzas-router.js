const Router = require('express');
const router = new Router();
const ProductsController = require('../controllers/products-controller')
const ApiError = require('../error/ApiError')
const { check, validationResult } = require('express-validator');

router.get('/', ProductsController.getAll)

module.exports = router
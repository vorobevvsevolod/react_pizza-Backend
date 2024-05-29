const Router = require('express');
const router = new Router();
const ProductsTypesController = require('../controllers/productsTypes-controller')
const ApiError = require('../error/ApiError')
const { check, validationResult } = require('express-validator');


router.get('/', ProductsTypesController.getAll)

module.exports = router
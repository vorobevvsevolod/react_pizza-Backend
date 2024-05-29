const Router = require('express');
const router = new Router();
const DopProductController = require('../controllers/dopPropuct-controller')
const ApiError = require('../error/ApiError')
const { check, validationResult } = require('express-validator');

router.get('/', DopProductController.getAll)

module.exports = router
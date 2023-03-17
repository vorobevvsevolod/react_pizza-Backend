const ApiError = require('../error/ApiError');
const authorizationValidator = require('../Validatios/authorization-Validator')
module.exports = async function  (req, res, next){
	try{
		const token = req.headers.authorization;
		if (!token) return next(ApiError.badRequest("Ошибка авторизации"));
		
		const destructToken = token.split(' ')[1];
		
		const result = await authorizationValidator(destructToken);
		if (!result.status) return next(ApiError.badRequest("Ошибка авторизации"));
		
		req.userId = result.id;
		next()
		
	}catch (e){
		return next(ApiError.internal(e.message));
	}
}
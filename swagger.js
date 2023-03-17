const swaggerJSDoc = require('swagger-jsdoc');
const swaggerOptions = {
	swaggerDefinition: {
		info: {
			title: 'React-Pizza-API',
			version: '1.0.0',
			description: 'API для доставки пиццы',
			contact: {
				name: 'Всеволод',
				email: 'seva31122003@mail.ru',
			},
		},
	},
	apis: ['./controllers/*.js'], // путь до вашего файла router.js
};

const swaggerSpec = swaggerJSDoc(swaggerOptions);
module.exports = swaggerSpec;
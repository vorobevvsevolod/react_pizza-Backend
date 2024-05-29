const AdminBro = require('admin-bro');
const AdminBroExpress = require('@admin-bro/express');
const AdminBroSequelize = require('@admin-bro/sequelize');
const theme = require('admin-bro-theme-dark')
AdminBro.registerAdapter(AdminBroSequelize);
const sequelize = require('../DB');
const { check, validationResult } = require('express-validator');
const adminBro = new AdminBro({
	databases: [sequelize],
	rootPath: '/admin',
	branding:{
		theme: {
		 colors: {
		  background: '#с1с1с1',
		  primary100: '#ff6613',
		  primary80: '#234567',
		  primary60: '#345678',
		  primary40: '#456789',
		  primary20: '#56789A',
		 },
		 fonts: {
		  fontFamily: 'Arial, sans-serif',
		 },
		},
		companyName: "React-pizza",
		softwareBrothers: false,
	},
	
  locale: {
    language: 'ru', 
  },

})

const ADMIN = {
	email: process.env.ADMIN_EMAIL ,
	password: process.env.ADMIN_PASSWORD ,
  }

const router = AdminBroExpress.buildAuthenticatedRouter(adminBro, {
	authenticate: async (email, password) => {
		const validateCredentials = [
			check('email')
			  .isEmail().withMessage('Введите корректный email')
			  .normalizeEmail().trim().escape(),
			check('password')
			  .isLength({ min: 8 }).withMessage('Пароль должен содержать минимум 8 символов')
			  .matches(/^[a-zA-Z0-9!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]*$/).withMessage('Пароль содержит недопустимые символы')
			  .trim().escape()
		  ];

		  const errors = validationResult(validateCredentials);
  		if (!errors.isEmpty()) {
  		  return null
  		}

		if (email === ADMIN.email && password === ADMIN.password) {
		  return ADMIN
		}
		return null
	  },
	cookiePassword: 'some-secret-password-used-to-secure-cookie',
   });
   
module.exports = router;

const AdminBro = require('admin-bro');
const AdminBroExpress = require('@admin-bro/express');
const AdminBroSequelize = require('@admin-bro/sequelize');
const theme = require('admin-bro-theme-dark')
AdminBro.registerAdapter(AdminBroSequelize);
const sequelize = require('../DB');
const { Users } = require('../models/models');

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
		if (email === ADMIN.email && password === ADMIN.password) {
		  return ADMIN
		}
		return null
	  },
	cookiePassword: 'some-secret-password-used-to-secure-cookie',
   });
   
module.exports = router;

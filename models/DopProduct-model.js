const sequalize = require('../DB')
const { DataTypes } = require('sequelize')

const DopProduct = sequalize.define('dod_product', {
	id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
	name: {type: DataTypes.STRING, allowNull: false},
	price: {type: DataTypes.INTEGER, allowNull: false},
	img_url: {type: DataTypes.STRING, defaultValue: 'static/dopProduct/1.jpg'},
})

module.exports = DopProduct;
const sequalize = require('../DB')
const { DataTypes } = require('sequelize')

const Products = sequalize.define('products', {
	id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
	name: {type: DataTypes.STRING, allowNull: false},
	description: {type: DataTypes.STRING, allowNull: false},
	price: {type: DataTypes.INTEGER, allowNull: false},
	img_url: {type: DataTypes.STRING, defaultValue: 'static/product/1.jpg'},
})

module.exports = Products;
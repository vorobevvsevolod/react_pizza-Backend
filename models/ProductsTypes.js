const sequalize = require('../DB')
const { DataTypes } = require('sequelize')

const productsTypes = sequalize.define('products_types', {
	id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
	name: {type: DataTypes.STRING, unique:true, allowNull: false},
})

module.exports = productsTypes;
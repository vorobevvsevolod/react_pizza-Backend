const sequalize = require('../DB')
const { DataTypes } = require('sequelize')

const BasketPizzaDopProducts = sequalize.define('basket_pizza_dopProduct', {
	id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
})

module.exports = BasketPizzaDopProducts
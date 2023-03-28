const sequalize = require('../DB')
const { DataTypes } = require('sequelize')

const OrderProduct= sequalize.define('order_product', {
	id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
	quantity: {type: DataTypes.INTEGER, defaultValue: 1},
	price: {type: DataTypes.INTEGER},
	price: {type: DataTypes.STRING},
})

module.exports = OrderProduct;
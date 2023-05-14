const sequalize = require('../DB')
const { DataTypes } = require('sequelize')

const Orders = sequalize.define('orders', {
	id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
	total_price: {type: DataTypes.INTEGER, allowNull: false},
	address: {type: DataTypes.STRING, allowNull: false},
	phone: {type: DataTypes.STRING},
})

module.exports = Orders;
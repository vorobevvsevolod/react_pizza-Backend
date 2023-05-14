const sequalize = require('../DB')
const { DataTypes } = require('sequelize')

const OrderStatus = sequalize.define('order_status', {
	id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
	name: {type: DataTypes.STRING, unique:true, allowNull: false},
})

module.exports = OrderStatus;
const sequalize = require('../DB')
const { DataTypes } = require('sequelize')

const Basket = sequalize.define('basket', {
	id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
	quantity: {type: DataTypes.INTEGER, defaultValue: 1},
	description: {type: DataTypes.STRING},
})

module.exports = Basket
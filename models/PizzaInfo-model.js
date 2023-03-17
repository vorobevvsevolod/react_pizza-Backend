const sequalize = require('../DB')
const { DataTypes } = require('sequelize')

const PizzaInfo = sequalize.define('pizza_info', {
	id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
	description: {type: DataTypes.STRING, allowNull: false},
	calories: {type: DataTypes.DOUBLE, allowNull: false},
	squirrels: {type: DataTypes.DOUBLE, allowNull: false},
	fats: {type: DataTypes.DOUBLE, allowNull: false},
	carbohydrates: {type: DataTypes.DOUBLE, allowNull: false},
	weight: {type: DataTypes.DOUBLE, allowNull: false},
})

module.exports = PizzaInfo;
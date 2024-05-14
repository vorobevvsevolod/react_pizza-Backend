const sequalize = require('../DB')
const { DataTypes } = require('sequelize')

const PizzaCombo = sequalize.define('pizza_combo', {
	id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
	increase: {type: DataTypes.INTEGER},
})

module.exports = PizzaCombo;
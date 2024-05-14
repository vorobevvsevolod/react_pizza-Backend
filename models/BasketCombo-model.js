const sequalize = require('../DB')
const { DataTypes } = require('sequelize')

const BasketCombo = sequalize.define('basket_combo', {
	id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
})

module.exports = BasketCombo
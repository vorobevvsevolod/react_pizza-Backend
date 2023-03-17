const sequalize = require('../DB')
const { DataTypes } = require('sequelize')

const DopProductPizza = sequalize.define('dop_product_pizza', {
	id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
})

module.exports = DopProductPizza;
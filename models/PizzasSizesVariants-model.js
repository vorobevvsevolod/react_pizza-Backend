const sequalize = require('../DB')
const { DataTypes } = require('sequelize')

const pizzasSizesVariants = sequalize.define('pizzas_sizes_variants', {
	id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
})

module.exports = pizzasSizesVariants;
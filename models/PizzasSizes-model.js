const sequalize = require('../DB')
const { DataTypes } = require('sequelize')

const pizzasSizes = sequalize.define('pizzas_sizes', {
	id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
	size: {type: DataTypes.STRING, unique:true, allowNull: false},
	dopPrice: {type: DataTypes.INTEGER}
})

module.exports = pizzasSizes;
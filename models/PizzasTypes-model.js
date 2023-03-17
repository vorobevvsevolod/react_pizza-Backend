const sequalize = require('../DB')
const { DataTypes } = require('sequelize')

const pizzasTypes = sequalize.define('pizzas_types', {
	id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
	type: {type: DataTypes.STRING, unique:true, allowNull: false},
})

module.exports = pizzasTypes;
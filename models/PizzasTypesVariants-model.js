const sequalize = require('../DB')
const { DataTypes } = require('sequelize')

const pizzasTypesVariants = sequalize.define('pizzas_types_variants', {
	id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
	price: {type: DataTypes.INTEGER, allowNull: false},
	img_url: {type: DataTypes.STRING, allowNull: false}
	
})

module.exports = pizzasTypesVariants;
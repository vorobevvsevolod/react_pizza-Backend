const sequalize = require('../DB')
const { DataTypes } = require('sequelize')

const ComboDefault = sequalize.define('combo_default', {
	id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
})

module.exports = ComboDefault;
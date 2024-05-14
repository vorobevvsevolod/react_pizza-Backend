const sequalize = require('../DB')
const { DataTypes } = require('sequelize')

const combo = sequalize.define('combo', {
	id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
	name: {type: DataTypes.STRING},
	description: {type: DataTypes.STRING},
	img_url: {type: DataTypes.STRING},
	price: {type: DataTypes.INTEGER},
})

module.exports = combo;
const sequalize = require('../DB')
const { DataTypes } = require('sequelize')

const users = sequalize.define('user', {
	id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
	username: {type: DataTypes.STRING, allowNull: false},
	phone: {type: DataTypes.STRING},
	email: {type: DataTypes.STRING, unique: true, allowNull: false},
	password: {type: DataTypes.STRING, allowNull: false},
	role: {type: DataTypes.STRING, defaultValue: "USER"}
})

module.exports = users;
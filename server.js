require('dotenv').config()
const express = require('express')
const cors = require('cors')
const path = require('path')

const sequelize = require('./DB')
const models = require('./models/models')
const routers = require('./routers/index')
const PORT = process.env.PORT || 5000
const fileUpload = require('express-fileupload')
const errorHandler = require('./middleware/errorHandlerMiddleware')
const { adminRouter } = require("./AdminBro")

const app = express();
app.use('/admin', adminRouter)
app.use(cors())
app.use(express.json())
app.use(express.static(path.resolve(__dirname, 'static/product')))
app.use(express.static(path.resolve(__dirname, 'static/dopProduct')))
app.use(express.static(path.resolve(__dirname, 'static/snacks')))
app.use(fileUpload({}))
app.use('/api', routers)
app.use(errorHandler)



const start = async () => {
	try {
		await sequelize.authenticate()
		await sequelize.sync()
		app.listen(PORT, () => console.log(`Сервер запущен на ${PORT} порту`))
	}catch (e) { console.log(e.message); }
}

start();





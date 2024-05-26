require('dotenv').config()
const express = require('express')
const cors = require('cors')
const fs = require('fs');
const path = require('path');
const moment = require('moment');
const { exec } = require('child_process');
const cron = require('node-cron');

const sequelize = require('./DB')
const models = require('./models/models')
const routers = require('./routers/index')
const PORT = process.env.PORT || 5000
const fileUpload = require('express-fileupload')
const errorHandler = require('./middleware/errorHandlerMiddleware')
const adminRouter = require("./AdminBro");
process.env.PATH += ';C:\\Program Files\\PostgreSQL\\16\\bin';

const backupDir = path.resolve(__dirname, 'backup');

if (!fs.existsSync(backupDir)) {
  fs.mkdirSync(backupDir);
}


cron.schedule('*/60 * * * *', () => { // Запуск каждые 10 минут
  exec('D:/Проекты/Сайты/React/backup_script.bat', (error, stdout, stderr) => {
    if (error) {
      console.error(`Ошибка выполнения скрипта: ${error}`);
      return;
    } else {
      console.log("Успешно создана резервная копия базы данных!");
    }
  });
});



const app = express();
app.use(cors())
app.use(express.json())

//Фотографии
app.use(express.static(path.resolve(__dirname, 'static/product')))
app.use(express.static(path.resolve(__dirname, 'static/dopProduct')))
app.use(express.static(path.resolve(__dirname, 'static/snacks')))
app.use(express.static(path.resolve(__dirname, 'static/Combo')))

app.use('/admin', adminRouter)


app.use(fileUpload({}))
app.use('/api', routers)
app.use(errorHandler)

// Обслуживание статических файлов React
app.use(express.static(path.resolve(__dirname, 'build')));

app.get('/*', (req, res) => {
  res.sendFile(path.join(__dirname, 'build', 'index.html'));
});



const start = async () => {
	try {
		await sequelize.authenticate()
		await sequelize.sync()
		app.listen(PORT, () => console.log(`Сервер запущен на ${PORT} порту`))
	}catch (e) { console.log(e.message); }
}

start();





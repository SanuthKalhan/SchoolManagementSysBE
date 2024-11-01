const { Sequelize, DataTypes } = require('sequelize');
const dbConfig = require('../config/db.config');


const sequelize = new Sequelize(dbConfig.DB, dbConfig.USER, dbConfig.PASSWORD, {
  host: dbConfig.HOST,
  dialect: dbConfig.dialect,
  pool: dbConfig.pool
})

const db = {};
db.Sequelize = Sequelize;
db.sequelize = sequelize;

db.admin = require('./Admin')(sequelize,DataTypes)
db.student = require('./Student')(sequelize,DataTypes)
db.lecturer = require('./Lecturer')(sequelize,DataTypes)
db.course = require('./Course')(sequelize,DataTypes)
db.stusub = require('./StuSub')(sequelize,DataTypes)
db.lecsub = require('./LecSub')(sequelize,DataTypes)



module.exports = db;
const { DataTypes } = require("sequelize");

module.exports = (sequelize) => {
  const LecSub = sequelize.define("LecSub", {
    lecturerId: {
      type: DataTypes.INTEGER,
      references: {
        model: "Lecturers",
        key: "id",
      },
      primaryKey: true,
      onDelete: 'CASCADE',
      onUpdate: 'CASCADE',
    },
    subCode: {
      type: DataTypes.INTEGER,
      references: {
        model: "Courses",
        key: "code",
      },
      primaryKey: true,
      onDelete: 'CASCADE', 
      onUpdate: 'CASCADE',
    },
  });

  return LecSub;
};

const { DataTypes } = require("sequelize");

module.exports = (sequelize) => {
  const StuSub = sequelize.define("StuSub", {
    studentId: {
      type: DataTypes.INTEGER,
      references: {
        model: "Students",
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

  return StuSub;
};

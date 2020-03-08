import Sequelize, { Model } from "sequelize";

class Category extends Model {
  static init(sequelize) {
    super.init(
      {
        name: Sequelize.STRING
      },
      {
        sequelize
      }
    );

    return this;
  }
  static associate(models) {
    this.belongsTo(models.File, { foreignKey: 'file_id', as : 'file'})
  }
}

export default Category;

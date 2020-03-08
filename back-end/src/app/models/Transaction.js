import Sequelize, { Model } from 'sequelize';

class Transaction extends Model {
  static init(sequelize) {
    super.init(
      {
        description: Sequelize.STRING,
        value: Sequelize.FLOAT,
        payment_type: Sequelize.TINYINT,
        transaction_type: Sequelize.TINYINT,
      }
    );
    return this
  }
  static associate(models) {
    this.belongsTo(models.Receipt, { foreignKey: 'receipt_id', as: 'receipt'});
    this.belongsTo(models.Category, { foreignKey: 'category_id', as: 'category'});
    this.belongsTo(models.User, {foreignKey: 'user_id', as: 'user'});
  }

}

export default Transaction;
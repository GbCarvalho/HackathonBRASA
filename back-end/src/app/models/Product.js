import Sequelize, { Model } from 'sequelize';
import product_receipt from './product_receipt';

class Product extends Model {
  static init(sequelize) {
    super.init({
      name: Sequelize.STRING,
      EAN: Sequelize.STRING,
      NCM: Sequelize.STRING,
    },
    {
      sequelize,
    }
    );

    return this;
  }

  static associate(models) {
    this.belongsToMany(models.Receipt, {
      through: 'Product_Receipt',
      as: 'receipts',
      otherKey: 'receipt_id',
			foreignKey: 'product_id'
    });
  }
}

export default Product;
import Sequelize, { Model } from 'sequelize';

class Product_Receipt extends Model {
  static init(sequelize) {
    super.init(
      {
        price: Sequelize.FLOAT,
        quantity: Sequelize.INTEGER,
      },
      {
        sequelize,
      }
    );
    return this;
  }

}

export default Product_Receipt;
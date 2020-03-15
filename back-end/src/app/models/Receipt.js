import Sequelize, { Model } from "sequelize";

class Receipt extends Model {
  static init(sequelize) {
    super.init(
      {
        access_key: Sequelize.STRING,
        receipt_date: Sequelize.DATE,
        receipt_value: Sequelize.FLOAT,
        taxes_value: Sequelize.FLOAT,
        place: Sequelize.STRING,
        provider: Sequelize.STRING,
        provider_trade: Sequelize.STRING
      },
      {
        sequelize
      }
    );

    return this;
  }

  static associate(models) {
    this.belongsToMany(models.Product, {
      through: "Product_Receipt",
      as: "products",
      foreignKey: "receipt_id",
      otherKey: "product_id"
    });
    this.belongsTo(models.Provider, {
      foreignKey: "provider_id",
      as: "provider"
    });
  }
}

export default Receipt;

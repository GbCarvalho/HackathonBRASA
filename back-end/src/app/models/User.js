import Sequelize, { Model } from "sequelize";

class User extends Model {
  static init(sequelize) {
    super.init(
      {
        name: Sequelize.STRING,
        surname: Sequelize.STRING,
        email: Sequelize.STRING,
        bith_date: Sequelize.DATE,
        sex: Sequelize.INTEGER,
        cpf: Sequelize.STRING
      },
      {
        sequelize
      }
    );
    return this;
  }
}

export default User;

import Sequelize, { Model } from "sequelize";

class User extends Model {
  static init(sequelize) {
    super.init(
      {
        nome: Sequelize.STRING,
        sobrenome: Sequelize.STRING,
        email: Sequelize.STRING,
        data_nascimento: Sequelize.DATE,
        sexo: Sequelize.NUMBER,
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

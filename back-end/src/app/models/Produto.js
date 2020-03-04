import Sequelize, { Model } from 'sequelize';

class Produto extends Model{
    static init(sequelize) {
        super.init(
            {
                nome: Sequelize.STRING,
                codEAN: Sequelize.STRING,
                codNCM: Sequelize.STRING,
            },
            {
                sequelize,
            },
        );

        return this;
    }
}

export default Produto;
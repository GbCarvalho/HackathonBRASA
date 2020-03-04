import Sequelize, { Model } from 'sequelize';

class Categoria extends Model{
    static init(sequelize) {
        super.init(
            {
                nome: Sequelize.STRING,
            },
            {
                sequelize,
            }

        );

        return this;
    }
}

export default Categoria;
import Sequelize, { Model, FLOAT } from 'sequelize';

class Emprestimo extends Model {
    static init(sequelize) {
        super.init(
            {
                descricao: Sequelize.STRING,
                valor_divida: Sequelize.FLOAT,
                data_pagamento: Sequelize.DATE
            },
            {
                sequelize,
            }
        );
    }
}

export default Emprestimo;
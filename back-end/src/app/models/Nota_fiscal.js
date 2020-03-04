import Sequelize, { Model } from 'sequelize';

class NotaFiscal extends Model {
    static init(sequelize){
        super.init(
            {
                chave_acesso: Sequelize.STRING,
                data_nota: Sequelize.DATE,
                cpf_vinculado: Sequelize.STRING,
                valor_nota: Sequelize.FLOAT,
                valor_impostos: Sequelize.FLOAT,
            },
            {
                sequelize,
            },
        );

        return this;
    }
}

export default NotaFiscal;
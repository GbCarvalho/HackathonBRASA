import Sequelize, { Model } from 'sequelize';
import bcypt from 'bryptjs';

class Usuario extends Model{
    static init(sequelize) {
        super.init(
            {
                nome: Sequelize.STRING,
                sobrenome: Sequelize.STRING,
                email: Sequelize.STRING,
                data_nascimento: Sequelize.DATEONLY,
                sexo: Sequelize.ENUM( { values: [1, 2, 3] }),
                cpf: Sequelize.STRING,
                password: Sequelize.VIRTUAL,
                password_hash: Sequelize.STRING,

            },
            {
                sequelize,
            },
        );

        this.addHook('beforeSave', async (user)=>{
            if (user.password) {
                user.password_hash = await bcypt.hash(user.password, 12);
            }
        });

        return this;
    };

    checkPassword(password) {
        return bcrypt.compare(password, this.password_hash);
      }

}

export default Usuario;
import Sequelize, { Model } from 'sequelize';

class Provider extends Model {
	static init(sequelize) {
		super.init(
			{
				nome: Sequelize.STRING,
				nome_fantasia: Sequelize.STRING,
				cnpj: Sequelize.STRING,
			},
			{
				sequelize,
			},
		);

		return this;
	}
}

export default Provider();
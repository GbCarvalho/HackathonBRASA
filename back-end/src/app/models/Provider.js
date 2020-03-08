import Sequelize, { Model } from 'sequelize';

class Provider extends Model {
	static init(sequelize) {
		super.init(
			{
				name: Sequelize.STRING,
				fantasy_name: Sequelize.STRING,
				cnpj: Sequelize.STRING,
			},
			{
				sequelize,
			},
		);

		return this;
	}
}

export default Provider;
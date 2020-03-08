import Sequelize, { Model } from 'sequelize';

class Receipt extends Model {
	static init(sequelize){
		super.init(
			{
				access_key: Sequelize.STRING,
				reciept_date: Sequelize.DATE,
				user_cpf: Sequelize.STRING,
				reciept_value: Sequelize.FLOAT,
				taxes_value: Sequelize.FLOAT,
			},
			{
				sequelize,
			},
		);

		return this;
	}

	static associate(models) {
		this.belongsTo(models.User, { foreignKey: 'user_id', as: 'user'});
		this.belongsTo(models.Category, { foreignKey: 'category_id', as: 'user'});
		this.belongsToMany(models.Product, {
			through: 'Product_Receipt',
			as: 'products',
			foreignKey: 'receipt_id',
			otherKey: 'product_id'
		});
		this.belongsTo(models.Provider, { foreignKey: 'provider_id', as: 'provider' })
	}

}

export default Receipt();
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('receipts', 
    { 
      id: {
        type: Sequelize.INTEGER,
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
      },
      access_key: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      receipt_date: {
        type: Sequelize.DATE,
        allowNull: false,
      },
      user_cpf:{
        type: Sequelize.STRING,
        allowNull: true
      },
      receipt_value: {
        type: Sequelize.FLOAT,
        allowNull: false
      },
      taxes_value: {
        type: Sequelize.FLOAT,
        allowNull:false,
      },
      user_id: {
        type: Sequelize.INTEGER,
        references: { model: 'users', key: 'id'},
        onupdate: 'CASCADE',
        onDelete: 'SET NULL',
        allowNull:false
      },
      provider_id: {
        type: Sequelize.INTEGER,
        references: { model: 'providers', key: 'id' },
        onDelete: 'SET NULL',
        onUpdate: 'CASCADE',
        allowNull: false,
      },
      category_id: {
        type: Sequelize.INTEGER,
        references: { model: 'categories', key: 'id' },
        onDelete: 'SET NULL',
        onUpdate: 'CASCADE',
        allowNull: false,
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
    });
  },

  down: (queryInterface, Sequelize) => {
    
    return queryInterface.dropTable('receipts');
  }
};

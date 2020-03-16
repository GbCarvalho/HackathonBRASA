module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable("manual_transaction", {
      access_key: {
        type: Sequelize.STRING,
        allowNull: false,
        primaryKey: true
      },
      transaction_value: {
        type: Sequelize.FLOAT,
        allowNull: false
      },
      taxes_value: {
        type: Sequelize.FLOAT,
        allowNull: true
      },
      provider_id: {
        type: Sequelize.INTEGER,
        references: { model: "providers", key: "cnpj" },
        onDelete: "SET NULL",
        onUpdate: "CASCADE",
        allowNull: true
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },

  down: (queryInterface, Sequelize) => {
    return queryInterface.dropTable("manual_transaction");
  }
};

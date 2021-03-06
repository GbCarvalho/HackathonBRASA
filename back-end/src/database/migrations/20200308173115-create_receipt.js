module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable("receipts", {
      access_key: {
        type: Sequelize.STRING,
        allowNull: false,
        primaryKey: true
      },
      receipt_date: {
        type: Sequelize.DATE,
        allowNull: false
      },
      user_cpf: {
        type: Sequelize.STRING,
        allowNull: true
      },
      receipt_value: {
        type: Sequelize.FLOAT,
        allowNull: false
      },
      taxes_value: {
        type: Sequelize.FLOAT,
        allowNull: false
      },
      provider_id: {
        type: Sequelize.INTEGER,
        references: { model: "providers", key: "cnpj" },
        onDelete: "SET NULL",
        onUpdate: "CASCADE",
        allowNull: false
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
    return queryInterface.dropTable("receipts");
  }
};

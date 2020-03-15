'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('Product_Receipts', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      quantity: {
        type: Sequelize.INTEGER,
        allowNull:false,
      },
      price: {
        type: Sequelize.FLOAT,
        allowNull: true
      },
      product_id: {
        type: Sequelize.INTEGER,
        references: { model: 'products', key: 'id'},
        onupdate: 'CASCADE',
        onDelete: 'SET NULL',
        allowNull:false
      },
      receipt_id: {
        type: Sequelize.INTEGER,
        references: { model: 'receipts', key: 'id' },
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
    return queryInterface.dropTable('users');
  },
  
}

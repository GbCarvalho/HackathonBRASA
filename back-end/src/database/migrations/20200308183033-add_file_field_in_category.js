'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
   return queryInterface.addColumn(
     'categories',
     'file_id',
     {
        type: Sequelize.INTEGER,
        references: { model: 'files', key: 'id'},
        onUpdate: 'CASCADE',
        onDelete: 'SET NULL',
        allowNull: true,
     }
   )
  },

  down: (queryInterface, Sequelize) => {
    return queryInterface.removeColumn('categories', 'file_id');
  }
};

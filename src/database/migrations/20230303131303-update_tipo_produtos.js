'use strict';

module.exports = {
  async up (queryInterface, Sequelize) {
    
    await queryInterface.addColumn('produto', 'tipo', { 
			type: Sequelize.STRING(100), 
			allowNull: false 
		});
  },

  async down (queryInterface, Sequelize) {
    await queryInterface.removeColumn('produto', 'tipo');
  }
};
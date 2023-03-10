'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up (queryInterface, Sequelize) {

    await queryInterface.createTable('produto', { 
      id: {
        type: Sequelize.INTEGER,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true
      },
      nome: {
        type: Sequelize.STRING(100),
        allowNull: false
      },
      descricao: {
        type: Sequelize.STRING(250),
        allowNull: false
      },
      preco:{
        type: Sequelize.FLOAT,
        allowNull: false
      },
      alcoolico: {
        type: Sequelize.TINYINT,
        allowNull: false
      },
      imagem: {
        type: Sequelize.STRING(100),
        allowNull: false
      },
      ativo: {
        type: Sequelize.TINYINT,
        allowNull: false
      },
      estoque:{
        type: Sequelize.TINYINT,
        allowNull: false
      },
      qtde_estoque:{
        type: Sequelize.INTEGER,
        allowNull: false
      },
      ingredientes: {
        type: Sequelize.STRING(250),
        allowNull: false
      },
      harmonizacao: {
        type: Sequelize.STRING(250),
        allowNull: false
      },
      graduacao_alcoolica:{
        type: Sequelize.FLOAT,
        allowNull: false
      },
      volume:{
        type: Sequelize.FLOAT,
        allowNull: false
      },
      createdAt: Sequelize.DATE,
      updatedAt: Sequelize.DATE,
      });
     
  },

  async down (queryInterface, Sequelize) {
    await queryInterface.dropTable('produto');
     
  }
};

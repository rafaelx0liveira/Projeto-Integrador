module.exports = (sequelize, DataTypes) =>{
  const Produto = sequelize.define("Produto", {

      idProduto: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false
      },

      nome: {
        type: DataTypes.STRING,
        allowNull: false
      },

      descricao: {
        type: DataTypes.STRING,
        allowNull: false
      },

      tipo: {
        type: DataTypes.STRING,
        allowNull: false
      },

      preco:{
        type: DataTypes.DECIMAL,
        allowNull: false
      },

      alcoolico: {
        type: DataTypes.TINYINT,
        allowNull: false
      },

      imagem: {
        type: DataTypes.STRING,
        allowNull: false
      },

      ativo: {
        type: DataTypes.TINYINT,
        allowNull: false
      },

      estoque:{
        type: DataTypes.TINYINT,
        allowNull: false
      },

      qtde_estoque:{
        type: DataTypes.INTEGER,
        allowNull: false
      },

      ingredientes: {
        type: DataTypes.STRING,
        allowNull: false
      },

      harmonizacao: {
        type: DataTypes.STRING,
        allowNull: false
      },

      graduacao_alcoolica:{
        type: DataTypes.STRING,
        allowNull: false
      },

      volume:{
        type: DataTypes.STRING,
        allowNull: false
      }
  },{
      tablename:"produto",
      timestamps: false,
      freezeTableName: true
  });

  return Produto;
};
module.exports = (sequelize, DataTypes) =>{
    const Produto = sequelize.define("Produto", {
      id: {
          type: DataTypes.INTEGER,
          autoIncrement: true,
          allowNull: false,
          primaryKey: true
        },
        nome: {
          type: DataTypes.STRING,
          allowNull: false
        },
        tipo: {
          type: DataTypes.STRING,
          allowNull: false
        },
        descricao: {
          type: DataTypes.STRING,
          allowNull: false
        },
        preco:{
          type: DataTypes.FLOAT,
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
          type: DataTypes.FLOAT,
          allowNull: false
        },
        volume:{
          type: DataTypes.FLOAT,
          allowNull: false
        }
    },{
        tablename:"Produtos",
        timestamps:true
    });

    return Produto;
};
module.exports = (sequelize, DataTypes) =>{
  const Pagamento = sequelize.define("Pagamento", {

      idPagamentos: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false
      },

      nome: {
        type: DataTypes.STRING,
        allowNull: false
      },

      numero:{
        type: DataTypes.STRING,
        allowNull: false
      },

      validade: {
        type: DataTypes.DATE,
        allowNull: false
      },

      cvv: {
        type: DataTypes.INTEGER,
        allowNull: false
      },

      usuario_idUsuario: {
          type: DataTypes.INTEGER,
          allowNull: false,
      }
  },{
      tablename:"pagamentos",
      timestamps: false
  });

  return Pagamento;
};
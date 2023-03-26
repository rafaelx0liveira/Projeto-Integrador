// Representação da tabela Usuario no banco de dados

module.exports = (sequelize, DataTypes) => {
    const Usuario = sequelize.define(
    "Usuario",
    {
        idUsuario: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
            allowNull: false,
        },
        nome: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        email: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        cpf: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        telefone: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        dtNascimento: {
            type: DataTypes.DATE,
            allowNull: false,
        },
        senha: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        is_admin: {
            type: DataTypes.BOOLEAN,
            allowNull: false,
        },
        novidades: {
            type: DataTypes.BOOLEAN,
            allowNull: false,
        }
    },
    {
        tableName: "usuario",
        timestamps: false,
        freezeTableName: true
    });

    Usuario.associate = (models) => {
        Usuario.hasMany(models.Endereco, {
          as: "usuarioEndereco",
          foreignKey: "Usuario_idUsuario"
        }),
        Usuario.hasMany(models.Pagamento, {
            as: "usuarioPagamento",
            foreignKey: "Usuario_idUsuario"
          })
      }

    return Usuario;
};

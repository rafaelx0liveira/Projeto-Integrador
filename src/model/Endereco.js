// Representação da tabela Usuario no banco de dados

module.exports = (sequelize, DataTypes) => {
    const Endereco = sequelize.define(
    "Endereco",
    {
        idEndereco: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
            allowNull: false,
        },
        rua: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        cep: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        numero: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        bairro: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        cidade: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        complemento: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        usuario_idUsuario: {
            type: DataTypes.INTEGER,
            allowNull: false,
        }
    },
    {   
        tableName: "endereco",
        timestamps: false,
        freezeTableName: true
    });

    return Endereco;
};
// Importando o model de endereço
const {Endereco} = require("../model");
const {Usuario} = require("../model");
const {Pagamento} = require("../model");

const userController = {
    showPerfil: (req,res) =>{
        res.render ('usuario_perfil')
    },
    showPedidos: (req,res) =>{
        res.render ('usuario_pedidos')
    },
    showEndereco: async (req,res) =>{

        const {email} = req.session.user;

        const usuario = await encontrarUsuario(email);

        const endereco = await Endereco.findOne({ where: { Usuario_idUsuario: usuario.idUsuario } });
        
        res.render ('usuario_endereço', {endereco: endereco})

    },
    showPagamentos: async (req,res) =>{
        const {email} = req.session.user;

        const usuario = await encontrarUsuario(email);

        const pagamentos = await Pagamento.findOne({ where: { Usuario_idUsuario: usuario.idUsuario } });

        res.render ('usuario_pagamentos', {pagamentos: pagamentos})
    }
}

// Função para achar usuario
const encontrarUsuario = async (email) => {
    const usuario = await Usuario.findOne({ where: { email } });
    return usuario;
}

module.exports = userController;
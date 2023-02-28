const userController = {
    showPerfil: (req,res) =>{
        res.render ('usuario_perfil')
    },
    showPedidos: (req,res) =>{
        res.render ('usuario_pedidos')
    },
    showEndereco: (req,res) =>{
        res.render ('usuario_endereço')
    },
    showPagamentos: (req,res) =>{
        res.render ('usuario_pagamentos')
    }
}

module.exports = userController;
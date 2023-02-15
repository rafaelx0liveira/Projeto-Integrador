const userController = {
    showPerfil: (req,res) =>{
        res.render ('usuario_perfil')
    },
    showPedidos: (req,res) =>{
        res.render ('usuario_pedidos')
    },
    showEnderecos: (req,res) =>{
        res.render ('usuario_enderecos')
    },
    showPagamentos: (req,res) =>{
        res.render ('usuario_pagamentos')
    }
}

module.exports = userController;
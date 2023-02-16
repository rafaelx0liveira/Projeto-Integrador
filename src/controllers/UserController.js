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
    },
    sair: (req,res) =>{
        // Destrói a sessão e desativa a propriedade req.session. Depois de concluído, o retorno de chamada será invocado.
        req.session.destroy((err) => {
            res.redirect('/index') // sempre disparará após a sessão ser destruída
        })
    }
}

module.exports = userController;
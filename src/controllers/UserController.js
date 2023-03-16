// Importando o model de endereço
const {Endereco} = require("../model");
const {Usuario} = require("../model");
const {Pagamento} = require("../model");

const userController = {
    showPerfil: (req,res) =>{
        res.render ('usuario_perfil')
    },

    // Criando o método de atualizar perfil
    atualizarPerfil: async (req, res) => {
        const {email, cpf, nome, telefone, dtNascimento} = req.body;

        console.log(req.body)

        // Atualizando os dados do usuário no banco de dados
        const usuarioAtualizado = await Usuario.update({
            email: email,
            nome: nome,
            telefone: telefone,
            dtNascimento: dtNascimento
        },{
            where: {
                cpf: cpf
            }
        });

        console.log("\n\n\n\nUSUARIO ATUAL.: " + usuarioAtualizado);

        // Atualizando os dados do usuário na sessão

        const usuario = await Usuario.findOne({ where: { cpf } });

        req.session.user = usuario;

        req.session.reload(err => {
        });

        console.log(req.session.user);

        // Redirecionando para a página de perfil
        // return res.render("usuario_perfil", {
        //     ok: "Perfil atualizado com sucesso!"
        // });

        return res.redirect("/perfil");
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
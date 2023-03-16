// Importando o model de endereço
const {Endereco} = require("../model");
const {Usuario} = require("../model");
const {Pagamento} = require("../model");

const userController = {
    // Mostrar a página de perfil
    showPerfil: (req,res) =>{
        res.render ('usuario_perfil')
    },

    // Criando o método de atualizar perfil
    atualizarPerfil: async (req, res) => {
        // Pegando os dados do formulário
        const {email, cpf, nome, telefone, dtNascimento} = req.body;

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

        // Buscando usuário no banco de dados
        const usuario = await Usuario.findOne({ where: { cpf } });

        // Atribuindo o usuário na sessão
        req.session.user = usuario;

        // Recarregando a sessão
        req.session.reload(err => {});

        // Redirecionando para a página de perfil
        return res.render("usuario_perfil", {
            ok: "Perfil atualizado com sucesso!"
        });

        //var string = encodeURIComponent('Perfil atualizado com sucesso!');

        //return res.redirect('/perfil');
    },

    // Criando o método de mostrar pedidos
    showPedidos: (req,res) =>{
        res.render ('usuario_pedidos')
    },

    // Criando o método de mostrar endereço
    showEndereco: async (req,res) =>{

        const {email} = req.session.user;

        const usuario = await findByEmail(email);

        const endereco = await Endereco.findOne({ where: { Usuario_idUsuario: usuario.idUsuario } });
        
        res.render ('usuario_endereço', {endereco: endereco})

    },

    // Criando o método de atualizar endereço
    atualizarEndereco: async (req, res) => {
        // Pegando os dados do formulário
        const {rua, cep, numero, bairro, cidade, complemento} = req.body;

        console.log("\n\n\n\n\n\n\nFORMULARIO: " + rua, cep, numero, bairro, cidade, complemento + "\n\n\n\n\n\n\n");

        // Buscando o usuário na sessão
        const {email} = req.session.user;

        console.log("\n\n\n\n\n\n\nEMAIL DA SESSÃO: " + email + "\n\n\n\n\n\n\n");

        // Buscando o usuário no banco de dados
        const usuario = await findByEmail(email);

        console.log("\n\n\n\n\n\n\nUSUARIO BY EMAIL: " + usuario + "\n\n\n\n\n\n\n");

        // Atualizando os dados do endereço no banco de dados
        const enderecoAtualizado = await Endereco.update({
            rua: rua,
            cep: cep,
            numero: numero,
            bairro: bairro,
            cidade: cidade,
            complemento: complemento
        },{
            where: {
                Usuario_idUsuario: usuario.idUsuario
            }
        });

        // Buscando o endereço no banco de dados
        const endereco = await Endereco.findOne({ where: { Usuario_idUsuario: usuario.idUsuario } });

        // Atribuindo o endereço na sessão
        req.session.endereco = endereco;

        // Recarregando a sessão
        req.session.reload(err => {});

        // Redirecionando para a página de endereço
        return res.render("usuario_endereço", {
            ok: "Endereço atualizado com sucesso!",
            endereco: endereco
        });
        
        //return res.redirect("/endereco");
        
    },

    showPagamentos: async (req,res) =>{
        const {email} = req.session.user;

        const usuario = await findByEmail(email);

        const pagamentos = await Pagamento.findOne({ where: { Usuario_idUsuario: usuario.idUsuario } });

        res.render ('usuario_pagamentos', {pagamentos: pagamentos})
    }
}

// Função para achar usuario
const findByEmail = async (email) => {
    const usuario = await Usuario.findOne({ where: { email } });
    return usuario;
}

module.exports = userController;
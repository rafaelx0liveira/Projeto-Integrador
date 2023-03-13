const Users = require("../database/old/Users");
const bcrypt = require("bcryptjs");
const format = require('date-fns');

const {Usuario} = require("../model");
const {Endereco} = require("../model");

const AuthController = {
    showCadastro: (req, res) => {
        res.render("cadastro");
    },
    showLogin: (req, res)=> {
        res.render("login");
    },
    
    // Criando o método de cadastro
    store: async (req, res) => {
        const {email, cpf, nome, telefone, dtNascimento, senha, senhaConfirmada, cep, rua, numero, bairro, cidade, complemento, novidades} = req.body;

        console.log("\n\n\n\n\n INÍCIO DO MÉTODO STORE \n\n\n\n\n");

        console.log("\n\n\n\n\n email: " + email 
        + "\n\n\n\n\n cpf: " + cpf
        + "\n\n\n\n\n nome: " + nome
        + "\n\n\n\n\n telefone: " + telefone
        + "\n\n\n\n\n dtNascimento: " + dtNascimento
        + "\n\n\n\n\n senha: " + senha
        + "\n\n\n\n\n senhaConfirmada: " + senhaConfirmada
        + "\n\n\n\n\n cep: " + cep
        + "\n\n\n\n\n rua: " + rua
        + "\n\n\n\n\n numero: " + numero
        + "\n\n\n\n\n bairro: " + bairro
        + "\n\n\n\n\n cidade: " + cidade
        + "\n\n\n\n\n complemento: " + complemento
        + "\n\n\n\n\n novidades: " + novidades
        );

        const is_admin = false;

        const verificandoUsuario = await Usuario.findOne({ where: { email } });

        if (verificandoUsuario) {
            return res.render("cadastro", {
                userError: "Usuário já cadastrado"
            });
        } else if(senha != senhaConfirmada) {
            return res.render("cadastro", {
                confirmed_PasswordError: "As senhas não conferem"
            });
        }

        // Criptografando a senha
        const senha_cripto = bcrypt.hashSync(senha, 12);

        // Criando o usuário
        const novoUsuario = {email, cpf, nome, telefone, dtNascimento, senha_cripto, is_admin, novidades};

        // Criando o endereço
        const novoEndereco = {cep, rua, numero, bairro, cidade, complemento};

        // Salvando o usuário
        await Usuario.create({
            id: Usuario.increment('id', {by: 1}),
            nome: novoUsuario.nome,
            email: novoUsuario.email,
            cpf: novoUsuario.cpf,
            telefone: novoUsuario.telefone,
            dtNascimento: novoUsuario.dtNascimento,
            senha: novoUsuario.senha_cripto,
            is_admin: novoUsuario.is_admin === 'true' ? true : false,
            novidades: novoUsuario.novidades === 'true' ? true : false
        });

        // Depois de criado o usuario, pegar o id do usuario e salvar no endereço
        const usuario = await Usuario.findOne({ where: { email } });
        console.log("\n\n ID DO USUARIO: " + usuario.idUsuario + "\n\n");

        // Salvando o endereço
        await Endereco.create({
            rua: novoEndereco.rua,
            cep: novoEndereco.cep,
            numero: novoEndereco.numero,
            bairro: novoEndereco.bairro,
            cidade: novoEndereco.cidade,
            complemento: novoEndereco.complemento,
            Usuario_idUsuario: usuario.idUsuario
        });

        // Redirecionando para a página de login
        return res.redirect("/login");
    },

    // Criando o método de login
    login: async (req, res) => {
        const {email, senha} = req.body;

        const auth_usuario = await Usuario.findOne({ where: { email } });
        
        if(auth_usuario == undefined) {
            console.log("Email não cadastrado!");
            return res.render("login", {
                emailError: "Email não cadastrado!"
            });
        }
        
        const senhaVerificada = bcrypt.compareSync(senha, auth_usuario.senha);

        //Verificando se o usuário existe
        if (!auth_usuario || !senhaVerificada) {
            return res.render("login", {
                loginError: "Usuário ou senha inválidos"
            });
        }

        // Salvando o usuário na sessão
        req.session.user = auth_usuario;

        // Redirecionando para a página de produtos
        return res.redirect("/catalogo");

    },

    // Criando o método de atualizar perfil
    atualizarPerfil: async (req, res) => {
        const {email, cpf, nome, telefone, dtNascimento} = req.body;

        // Atualizando os dados do usuário no banco de dados
        const usuarioAtualizado = await Usuario.update({
            email: email,
            nome: nome,
            telefone: telefone,
            dtNascimento: dtNascimento
        }, {
            where: {
                cpf: cpf
            }
        });

        // Atualizando os dados do usuário na sessão
        req.session.user = usuarioAtualizado;

        // Redirecionando para a página de perfil
        return res.render("usuario_perfil", {
            ok: "Perfil atualizado com sucesso!"
        });
    },

    // Criando o método de logout
    logout: (req,res) =>{
        // Destrói a sessão e desativa a propriedade req.session. Depois de concluído, o retorno de chamada será invocado.
        req.session.destroy((err) => {
            res.redirect('/index') // sempre disparará após a sessão ser destruída
        })
    }


};

module.exports = AuthController;



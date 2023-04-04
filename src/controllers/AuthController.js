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
    cadastro: async (req, res) => {
        const {email, cpf, nome, telefone, dtNascimento, senha, senhaConfirmada, cep, rua, numero, bairro, cidade, complemento, novidades} = req.body;

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

        // Salvando o endereço
        await Endereco.create({
            rua: novoEndereco.rua,
            cep: novoEndereco.cep,
            numero: novoEndereco.numero,
            bairro: novoEndereco.bairro,
            cidade: novoEndereco.cidade,
            complemento: novoEndereco.complemento,
            usuario_idUsuario: usuario.idUsuario
        });

        // Redirecionando para a página de login
        return res.redirect("/login");
    },

    // Criando o método de login
    login: async (req, res) => {      
        
        const {email, senha} = req.body;

        const auth_usuario = await Usuario.findOne({ where: { email },
            include: [
                {
                    association: "usuarioEndereco",
                }
            ],
        });
        
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

    // Criando o método de logout
    logout: (req,res) =>{
        // Destrói a sessão e desativa a propriedade req.session. Depois de concluído, o retorno de chamada será invocado.
        req.session.destroy((err) => {
            res.redirect('/index') // sempre disparará após a sessão ser destruída
        })
    }


};

module.exports = AuthController;



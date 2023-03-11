const Users = require("../database/old/Users");
const bcrypt = require("bcryptjs");
const format = require('date-fns');

const {Usuario} = require("../model");

const AuthController = {
    showCadastro: (req, res) => {
        res.render("cadastro");
    },
    showLogin: (req, res)=> {
        res.render("login");
    },
    
    // Criando o método de cadastro
    store: (req, res) => {
        const {email, cpf, nome, telefone, dtNascimento, senha, senhaConfirmada, cep, rua, numero, bairro, cidade, complemento, noticias} = req.body;

        /* Separa os valores */
        let dataSplitada = dtNascimento.split("-");

        /* Define a data com os valores separados */
        let data = new Date(dataSplitada);

        let dataBR = format.format(data, "dd/MM/yyyy");

        // const verifyUser = Users.findUser(email);

        const verifyUser = User.findUser(email);

        if (verifyUser) {
            return res.render("cadastro", {
                userError: "Usuário já cadastrado"
            });
        } else if(senha != senhaConfirmada) {
            return res.render("cadastro", {
                confirmed_PasswordError: "As senhas não conferem"
            });
        }

        // Criptografando a senha
        const hash = bcrypt.hashSync(senha, 12);

        // Criando o usuário
        const newUser = {email, cpf, nome, telefone, dataBR, hash, cep, rua, numero, bairro, cidade, complemento, noticias};

        // Salvando o usuário
        Users.create(newUser);

        // Redirecionando para a página de login
        return res.redirect("/login");
    },

    // Criando o método de login
    login: async (req, res) => {
        const {email, senha} = req.body;

        //const user = User.findUser(email);
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



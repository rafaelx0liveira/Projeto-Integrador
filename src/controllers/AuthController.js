const Users = require("../model/Users");
const bcrypt = require("bcryptjs");

const AuthController = {
    showCadastro: (req, res) => {
        res.render("cadastro");
    },
    showLogin: (req, res)=> {
        res.render("login");
    },
    
    // Criando o método de cadastro
    store: (req, res) => {
        const { name, email, password } = req.body;
        const verifyUser = Users.findUser(email);

        if (verifyUser) {
            return res.render("cadastro", {
                error: "Usuário já cadastrado"
            });
        }

        // Criptografando a senha
        const hash = bcrypt.hashSync(password, 12);

        // Criando o usuário
        const newUser = {name, email, hash};

        // Salvando o usuário
        Users.create(newUser);

        // Redirecionando para a página de login
        return res.redirect("/login");
    },

    // Criando o método de login
    login: (req, res) => {
        const {email, password} = req.body;

        const user = Users.findUser(email);

        if(user == undefined) {
            console.log("Email não cadastrado!");
            return res.render("login", {
                emailError: "Email não cadastrado!"
            });
        }


        const verifyPassword = bcrypt.compareSync(password, user.password);

        // Verificando se o usuário existe
        if (!user || !verifyPassword) {
            return res.render("login", {
                error: "Usuário ou senha inválidos"
            });
        }

        // Salvando o usuário na sessão
        req.session.user = user;

        // Redirecionando para a página de produtos
        return res.redirect("/produtos");
    }
};

module.exports = AuthController;



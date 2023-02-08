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
        const {email, cpf, nome, telefone, dtNascimento, senha, senhaConfirmada, cep, rua, numero, bairro, cidade, complemento, noticias} = req.body;

        console.log("\n\n\n\n\n" + 
        "email: "+ email + "\n" +
        "cpf: "+ cpf +  "\n" +
        "nome: "+ nome + "\n" +
        "tel: "+ telefone + "\n" +
        "nasci: "+ dtNascimento + "\n" +
        "senha: "+ senha + "\n" +
        "senha Confirm: "+ senhaConfirmada + "\n" +
        "cep: "+ cep + "\n" +
        "rua: "+ rua + "\n" +
        "numero: "+ numero + "\n" +
        "bairro: "+ bairro + "\n" +
        "cidade: "+ cidade + "\n" +
        "compleme: "+ complemento + "\n" +
        "noticias: "+ noticias + "\n" +
        + "\n\n\n\n\n");

        const verifyUser = Users.findUser(email);

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
        const newUser = {email, cpf, nome, telefone, dtNascimento, hash, cep, rua, numero, bairro, cidade, complemento, noticias};

        // Salvando o usuário
        Users.create(newUser);

        // Redirecionando para a página de login
        return res.redirect("/login");
    },

    // Criando o método de login
    login: (req, res) => {
        const {email, senha} = req.body;

        const user = Users.findUser(email);

        if(user == undefined) {
            console.log("Email não cadastrado!");
            return res.render("login", {
                emailError: "Email não cadastrado!"
            });
        }


        const verifyPassword = bcrypt.compareSync(senha, user.password);

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



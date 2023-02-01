const AuthController = {
  showCadastro: (req, res) => {
        res.render("cadastro");
    },
    showLogin: (req, res)=> {
        res.render("login");
    } 
};

module.exports = AuthController;



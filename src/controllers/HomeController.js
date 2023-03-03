const catalogo = require("../model/catalogo-produtos");

const homeController = {
  showHome: (req, res) => {
    //Buscando os produtos no model
    const produtos = catalogo.findAll();

    //Renderizando a view catalogo e passando os produtos
    res.render("index", { produtos });
  },
  showLojas: (req, res) => {
    res.render("lojas");
  },
  showCatalogo: (req, res) => {
    //Buscando os produtos no model
    const produtos = catalogo.findAll();

    //Renderizando a view catalogo e passando os produtos
    res.render("catalogo", { produtos });
  },
  showContato: (req, res) => {
    res.render("contato");
  },
  showTermos: (req, res) => {
    res.render("termos");
  },
  showCarrinho: (req, res) => {
    res.render("carrinho");
  },
  showCheckAge: (req, res) => {
    res.render("checagem_idade");
  },
  showAgeDeclined: (req, res) => {
    res.render("idade_recusada");
  },
};
module.exports = homeController;

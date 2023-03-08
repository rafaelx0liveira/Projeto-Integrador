// const catalogo = require("../database/old/catalogo-produtos");
const {Produto} = require("../model")

const homeController = {
  showHome: async (req, res) => {
    //Buscando os produtos no model
    const produtosTop = await Produto.findAll({ limit: 15 });
    const produtosCerveja = await Produto.findAll({ where: {
      tipo: "cerveja"
    }, limit: 10})
    const produtosUisque = await Produto.findAll({ where: {
      tipo: "uisque"
    }, limit: 10 })
    //Renderizando a view catalogo e passando os produtos
    res.render("index", { produtosTop,produtosCerveja,produtosUisque });
  },
  showLojas: (req, res) => {
    res.render("lojas");
  },
  showCatalogo: async(req, res) => {
    //Buscando os produtos no model
    const produtos = await Produto.findAll();

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

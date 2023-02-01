const homeController = {
  showCheckAge: (req, res) => {
    res.render("checagem_idade");
  },
  showAgeDeclined: (req, res) => {
    res.render("idade_recusada");
  },
  showHome: (req, res) => {
    res.render("index");
  },
  showLojas: (req, res) => {
    res.render("lojas");
  },
  showCatalogo: (req, res) => {
    res.render("catalogo");
  },
  showContato: (req, res) => {
    res.render("contato");
  },
  showTermos: (req, res) => {
    res.render("termos");
  },
      showCarrinho: (req,res) =>{
        res.render ('carrinho')
    }
};
module.exports = homeController;

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
};
module.exports = homeController;

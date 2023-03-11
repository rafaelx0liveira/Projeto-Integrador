const {Produto} = require("../model")

const homeController = {
  showHome: async (req, res) => {
    //Buscando os produtos no banco

    const produtosTop = await Produto.findAll({ limit: 15 });
    const produtosCerveja = await Produto.findAll({ where: {
      tipo: "cerveja"
    }, limit: 10})
    const produtosUisque = await Produto.findAll({ where: {
      tipo: "uisque"
    }, limit: 10 })

    //Renderizando a view index e passando os produtos
    res.render("index", { produtosTop,produtosCerveja,produtosUisque });
  },

  showLojas: (req, res) => {
    res.render("lojas");
  },
  
  showCatalogo: async(req, res) => {
    //paginação
    //valor fixo para página para inicar 
    let totalPorPagina = 15
    let { page = 1 } = req.query;
    
    if(page < 1){
      page = 1
    }

    let prevPage = Number(page) - Number(1);
    let nextPage = Number(page) + Number(1);

    //busca o total de registros
    let { count: total, rows: produtos } = await Produto.findAndCountAll({
      where:{
        ativo: 1
      },
      limit: totalPorPagina,
      offset: (page - 1) * totalPorPagina,
    });

    let totalPagina = Math.ceil(total / totalPorPagina);
    
    //Renderizando a view catalogo e passando os produtos
    res.render("catalogo", { produtos, totalPagina, page, prevPage, nextPage});
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

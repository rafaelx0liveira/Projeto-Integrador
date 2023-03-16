const { Produto } = require("../model");
const Sequelize = require("sequelize");

let message = "";
let type = "";

const AdminController = {
  showLoginAdmin: (req, res) => {
    res.render("admin/login/index");
  },
  showIndex: async (req, res) => {
    let { count: total } = await Produto.findAndCountAll();

    let { count: emEstoque } = await Produto.findAndCountAll({
      where: {
        estoque: 1,
      },
    });

    let { count: foraEstoque } = await Produto.findAndCountAll({
      where: {
        estoque: 0,
      },
    });

    res.render("admin/index", { total, emEstoque, foraEstoque });
  },
  showPedidos: (req, res) => {
    res.render("admin/pedidos/index");
  },
  showDetalhePedido: (req, res) => {
    res.render("admin/pedidos/detalhePedido");
  },
  showProdutos: async (req, res) => {
    let { page = 1 } = req.query;
    let totalPorPagina = 15;

    if (page < 1) {
      page = 1;
    }

    let prevPage = Number(page) - Number(1);
    let nextPage = Number(page) + Number(1);

    let { count: total, rows: produtos } = await Produto.findAndCountAll({
      limit: totalPorPagina,
      offset: (page - 1) * totalPorPagina,
    });

    let totalPagina = Math.ceil(total / totalPorPagina);

    res.render("admin/produtos/index", {
      produtos,
      page,
      totalPorPagina,
      totalPagina,
      prevPage,
      nextPage,
    });
  },
  showEditarProduto: async (req, res) => {
    
    setTimeout(() => {
      message = "";
    }, 1000);

    let { id } = req.params;

    let optionsTipo = await Produto.findAll({
      attributes: [[Sequelize.fn("DISTINCT", Sequelize.col("tipo")), "tipo"]],
      order: [["tipo"]],
    });

    let optionsAlcoolico = await Produto.findAll({
      attributes: [
        [Sequelize.fn("DISTINCT", Sequelize.col("alcoolico")), "alcoolico"],
      ],
      order: [["alcoolico"]],
    });

    let produto = await Produto.findByPk(id);
    res.render("admin/produtos/editarProduto", {
      produto,
      optionsTipo,
      optionsAlcoolico,
      message,
      type
    });
  },
  update: async (req, res) => {
    const { id } = req.params;
    
    const { estoque, ativo, nome, alcolico, graduacao_alcoolica,volume,tipo,preco,imagem, descricao,ingredientes,harmonizacao} = req.body;
    
    await Produto.update(
      {
        estoque: estoque == 'on' ? true : false, 
        ativo: ativo == 'on' ? true : false, 
        nome,
        alcolico: alcolico == 1 ? true : false, 
        graduacao_alcoolica,
        volume,
        tipo,
        preco: preco.slice(3, preco.length).replace(',','.'),
        imagem, 
        descricao,
        ingredientes,
        harmonizacao
      },
      {
        where: {
          id: id,
        },
      }
    );

    message = "Produto atualizado com sucesso!";
    type = "success";
    
    res.redirect(`/admin/produtos/editar/${id}`);
  },
  showCadastrarProduto: async (req, res) => {
    let optionsTipo = await Produto.findAll({
      attributes: [[Sequelize.fn("DISTINCT", Sequelize.col("tipo")), "tipo"]],
      order: [["tipo"]],
    });

    let optionsAlcoolico = await Produto.findAll({
      attributes: [
        [Sequelize.fn("DISTINCT", Sequelize.col("alcoolico")), "alcoolico"],
      ],
      order: [["alcoolico"]],
    });

    res.render("admin/produtos/cadastroProduto", {optionsTipo, optionsAlcoolico});
  },
  create: async(req, res)=>{
    const { estoque, ativo, nome, alcolico, graduacao_alcoolica, volume, tipo, preco, imagem,descricao, ingredientes, harmonizacao} = req.body

    console.log(req.body)

    res.redirect("/admin/produtos");
  },
  showClientes: (req, res) => {
    res.render("admin/clientes/index");
  },
  showEditarCliente: (req, res) => {
    res.render("admin/clientes/editarCliente");
  },
};

module.exports = AdminController;

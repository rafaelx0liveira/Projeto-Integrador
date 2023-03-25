const { Produto, Usuario, Endereco, Pagamento } = require("../model");
const Sequelize = require("sequelize");

let message = "";
let type = "";
let listErros = [];

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

    let { count: totalUsers } = await Usuario.findAndCountAll();

    res.render("admin/index", { total, emEstoque, foraEstoque, totalUsers });
  },
  showPedidos: (req, res) => {
    res.render("admin/pedidos/index");
  },
  showDetalhePedido: (req, res) => {
    res.render("admin/pedidos/detalhePedido");
  },
  showProdutos: async (req, res) => {
    setTimeout(() => {
      message = "";
    }, 1000);

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
      message,
      type,
    });
  },
  showEditarProduto: async (req, res) => {
    setTimeout(() => {
      message = "";
      listErros = [];
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
      type,
      listErros,
    });
  },
  updateProduct: async (req, res) => {
    const { id } = req.params;

    const {
      estoque,
      ativo,
      nome,
      alcoolico,
      graduacao_alcoolica,
      volume,
      tipo,
      preco,
      imagem,
      descricao,
      ingredientes,
      harmonizacao,
    } = req.body;

    if (nome == "") {
      listErros.push("nome");
    }

    if (
      alcoolico == "1" &&
      (graduacao_alcoolica == "" || graduacao_alcoolica == "/")
    ) {
      listErros.push("graduacao_alcoolica");
    }

    if (volume == "") {
      listErros.push("volume");
    }

    if (preco == "") {
      listErros.push("preco");
    }

    if (imagem == "") {
      listErros.push("imagem");
    }

    if (descricao == "") {
      listErros.push("descricao");
    }

    if (ingredientes == "") {
      listErros.push("ingredientes");
    }

    if (harmonizacao == "") {
      listErros.push("harmonizacao");
    }

    if (listErros.length !== 0) {
      return res.redirect(`/admin/produtos/editar/${id}`);
    }

    await Produto.update(
      {
        estoque: estoque == "on" ? true : false,
        ativo: ativo == "on" ? true : false,
        nome,
        alcoolico: alcoolico == "1" ? true : false,
        graduacao_alcoolica: alcoolico == "0" ? "" : graduacao_alcoolica,
        volume,
        tipo,
        preco: preco.slice(3, preco.length).replace(",", "."),
        imagem,
        descricao,
        ingredientes,
        harmonizacao,
      },
      {
        where: {
          idProduto: id,
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

    res.render("admin/produtos/cadastroProduto", {
      optionsTipo,
      optionsAlcoolico,
      listErros,
    });
  },
  createProduct: async (req, res) => {
    const {
      estoque,
      ativo,
      nome,
      alcoolico,
      graduacao_alcoolica,
      volume,
      tipo,
      preco,
      imagem,
      descricao,
      ingredientes,
      harmonizacao,
    } = req.body;

    if (nome == "") {
      listErros.push("nome");
    }

    if (
      alcoolico == "1" &&
      (graduacao_alcoolica == "" || graduacao_alcoolica == "/")
    ) {
      listErros.push("graduacao_alcoolica");
    }

    if (volume == "") {
      listErros.push("volume");
    }

    if (preco == "") {
      listErros.push("preco");
    }

    if (imagem == "") {
      listErros.push("imagem");
    }

    if (descricao == "") {
      listErros.push("descricao");
    }

    if (ingredientes == "") {
      listErros.push("ingredientes");
    }

    if (harmonizacao == "") {
      listErros.push("harmonizacao");
    }

    if (listErros.length !== 0) {
      return res.redirect("/admin/produtos/cadastro");
    }

    const hasEstoque = estoque == "on" ? true : false;
    const isAtivo = ativo == "on" ? true : false;
    const isAlcoolico = alcoolico == 1 ? true : false;

    await Produto.create({
      estoque: hasEstoque,
      ativo: isAtivo,
      nome,
      alcoolico: isAlcoolico,
      graduacao_alcoolica,
      volume,
      tipo,
      preco,
      qtde_estoque: 10,
      imagem,
      descricao,
      ingredientes,
      harmonizacao,
    });

    message = "Produto cadastrado com sucesso!";
    type = "success";

    res.redirect("/admin/produtos");
  },
  showClientes: async (req, res) => {
    let users = await Usuario.findAll();

    res.render("admin/clientes/index", { users });
  },
  showEditarCliente: async (req, res) => {
    const { id } = req.params;

    // let {rows: enderecoUser} = await Endereco.findAll({
    //   where: {
    //     usuario_idUsuario: id,
    //   },
    // });

    // let pagamentoUser = await Pagamento.findAll({
    //   where: {
    //     usuario_idUsuario: id,
    //   },
    // });

    // console.log(enderecoUser);
    // console.log(pagamentoUser);

    const user = await Usuario.findAll({
      where:{
        idUsuario: id
      },
      include:[{
        association: "usuarioEndereco"
      },{
        association: "usuarioPagamento"
      }]
    });
    
    const userInfo = user[0].dataValues;
    const enderecoInfo = userInfo.usuarioEndereco[0].dataValues;;
    const pagamentoInfo = null

    if(userInfo.usuarioPagamento[0]){
      pagamentoInfo = userInfo.usuarioPagamento[0].dataValues;
    }

    // if(userInfo.usuarioEndereco[0]){
    //   enderecoInfo = 
    // }

    res.render("admin/clientes/editarCliente", {userInfo,enderecoInfo, pagamentoInfo});
  },
  authLoginAdmin: (req, res)=>{
    
  }
};

module.exports = AdminController;

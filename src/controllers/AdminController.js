const AdminController = {
    showLoginAdmin: (req, res)=>{
        res.render("admin/login/index");
    },
    showIndex: (req, res)=>{
        res.render("admin/index");
    },
    showPedidos: (req, res)=>{
        res.render("admin/pedidos/index");
    },
    showDetalhePedido: (req, res)=>{
        res.render("admin/pedidos/detalhePedido");
    },
    showProdutos: (req, res)=>{
        res.render("admin/produtos/index");
    },
    showEditarProduto: (req, res)=>{
        res.render("admin/produtos/editarProduto");
    },
    showCadastrarProduto: (req, res)=>{
        res.render("admin/produtos/cadastroProduto");
    },
    showClientes: (req, res)=>{
        res.render("admin/clientes/index");
    },
    showEditarCliente: (req, res)=>{
        res.render("admin/clientes/editarCliente");
    },
}

module.exports = AdminController;
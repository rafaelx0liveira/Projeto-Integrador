const express = require("express");
const router = express.Router();
const AdminController = require("../controllers/AdminController");

//LOGIN
router.get("/login", AdminController.showLoginAdmin);

//INDEX - DASHBOARD
router.get("/index", AdminController.showIndex);

//PEDIDOS
router.get("/pedidos", AdminController.showPedidos);
router.get("/detalhePedido", AdminController.showDetalhePedido);

//PRODUTOS
router.get("/produtos", AdminController.showProdutos);
router.get("/produtos/editar/:id", AdminController.showEditarProduto);
router.put("/produto/editar/:id", AdminController.updateProduct);
router.get("/produtos/cadastro", AdminController.showCadastrarProduto);
router.post("/produto/cadastro", AdminController.createProduct);

//CLIENTES
router.get("/clientes", AdminController.showClientes);
router.get("/clientes/editar/:id", AdminController.showEditarCliente);


module.exports = router;

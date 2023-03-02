const express = require("express");
const router = express.Router();
const AdminController = require("../controllers/AdminController");

router.get("/login", AdminController.showLoginAdmin);
router.get("/index", AdminController.showIndex);
router.get("/pedidos", AdminController.showPedidos);
router.get("/detalhePedido", AdminController.showDetalhePedido);
router.get("/produtos", AdminController.showProdutos);
router.get("/produtos/editar", AdminController.showEditarProduto);
router.get("/produtos/cadastro", AdminController.showCadastrarProduto);
router.get("/clientes", AdminController.showClientes);
router.get("/clientes/editar", AdminController.showEditarCliente);


module.exports = router;

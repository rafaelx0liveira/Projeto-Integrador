const express = require('express');
const userController = require ('../controllers/UserController');
const router = express.Router();

// Rota para a página de perfil
router.get ('/perfil', userController.showPerfil);
router.put ('/perfil', userController.atualizarPerfil);

// Rota para a página de pedidos
router.get ('/pedidos', userController.showPedidos);
//router.put ('/pedidos', userController.atualizarPedidos);

// Rota para a página de endereço
router.get ('/endereco', userController.showEndereco);
router.put ('/endereco', userController.atualizarEndereco);


// Rota para a página de pagamentos
router.get ('/pagamentos', userController.showPagamentos);
router.put ('/pagamentos', userController.atualizarPagamentos);
router.post ('/pagamentos', userController.cadastrarPagamentos);

module.exports = router;

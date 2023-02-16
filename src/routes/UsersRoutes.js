const express = require('express');
const usersController = require ('../controllers/UserController');
const router = express.Router();

router.get ('/perfil', usersController.showPerfil);
router.get ('/pedidos', usersController.showPedidos);
router.get ('/endereco', usersController.showEndereco);
router.get ('/pagamentos', usersController.showPagamentos);
router.get ('/sair', usersController.sair);

module.exports = router;

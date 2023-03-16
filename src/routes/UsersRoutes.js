const express = require('express');
const userController = require ('../controllers/UserController');
const router = express.Router();

router.get ('/perfil', userController.showPerfil);
router.put ('/perfil', userController.atualizarPerfil);
router.get ('/pedidos', userController.showPedidos);
//router.put ('/pedidos', userController.atualizarPedidos);
router.get ('/endereco', userController.showEndereco);
router.get ('/pagamentos', userController.showPagamentos);


module.exports = router;

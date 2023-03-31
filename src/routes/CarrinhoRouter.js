const express = require('express');
const router = express.Router();
const CarrinhoController = require('../controllers/CarrinhoController');

router.get('/carrinho', CarrinhoController.showCarrinho);
router.post('/carrinho/adicionar', CarrinhoController.addProduto);

module.exports = router;
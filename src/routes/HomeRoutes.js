
const express = require("express");
const HomeController = require("../controllers/HomeController");
const router = express.Router();

router.get("/", HomeController.showCheckAge);
router.get("/idade_recusada", HomeController.showAgeDeclined);
router.get("/index", HomeController.showHome);

// GET /loja
router.get('/lojas', HomeController.showLojas);

// GET /catalogo
router.get('/catalogo', HomeController.showCatalogo);

// GET /contato
router.get('/contato', HomeController.showContato);

// GET /termos
router.get('/termos', HomeController.showTermos);

router.get ('/carrinho', HomeController.showCarrinho)


module.exports = router


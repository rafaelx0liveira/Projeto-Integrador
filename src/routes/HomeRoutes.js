
// Importando o express
const express = require("express");
const HomeController = require("../controllers/HomeController");
const isLogin = require("../middlewares/isLogin");

// Criando o roteador
const router = express.Router();

// Definindo as rotas

// Middleware para verificar se o usuário está logado
router.use(isLogin);

// GET /
router.get("/", HomeController.showCheckAge);

// GET /idade_recusada
router.get("/idade_recusada", HomeController.showAgeDeclined);

// GET /index
router.get("/index", HomeController.showHome);

// GET /loja
router.get('/lojas', HomeController.showLojas);

// GET /catalogo
router.get('/catalogo', HomeController.showCatalogo);
router.get('/catalogo/search', HomeController.search);

// GET /contato
router.get('/contato', HomeController.showContato);

// GET /termos
router.get('/termos', HomeController.showTermos);


module.exports = router


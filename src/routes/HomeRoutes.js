const express = require('express');
const HomeController = require('../controllers/HomeController');
const router = express.Router();

// GET /
router.get('/', HomeController.showHome);

// GET /loja
router.get('/lojas', HomeController.showLojas);

// GET /produtos
router.get('/catalogo', HomeController.showCatalogo);


module.exports = router


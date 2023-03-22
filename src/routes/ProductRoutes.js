const express = require('express');
const HomeController = require('../controllers/HomeController');
const ProductController = require('../controllers/ProductController');

const router = express.Router();

// GET /product/:id
router.get('/produto/:id', ProductController.showProduct);


module.exports = router;
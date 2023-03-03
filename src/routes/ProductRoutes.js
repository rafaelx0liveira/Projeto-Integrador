const express = require('express');
const ProductController = require('../controllers/ProductController');

const router = express.Router();

// GET /product/:id
router.get('/produto/:id', ProductController.showProduct);

module.exports = router;
const express = require('express')
const ProductsController = require('../controllers/ProductsController')
const router = express.Router()

router.get ('/produtos', ProductsController.showProduct)

module.exports = router

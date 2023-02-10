const express = require("express");
const router = express.Router();
const AdminController = require("../controllers/AdminController");

router.get("/login", AdminController.showLoginAdmin);
router.get("/dashboard", AdminController.showDashAdmin);
router.get("/produtos", AdminController.showProdutosAdmin);



module.exports = router;

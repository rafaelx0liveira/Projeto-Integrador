const express = require("express");
const AuthController = require("../controllers/AuthController");
const router = express.Router();

router.get("/cadastro", AuthController.showCadastro);
router.post("/cadastro", AuthController.store);
router.put("/cadastro", AuthController.atualizarPerfil);
router.get("/login", AuthController.showLogin);
router.post("/login", AuthController.login);
router.get ('/logout', AuthController.logout);

module.exports = router;

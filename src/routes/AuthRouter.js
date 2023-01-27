const express = require("express");
const AuthController = require("../controllers/AuthController");
const router = express.Router();

router.get("/login", AuthController.showLogin)

module.exports = router;

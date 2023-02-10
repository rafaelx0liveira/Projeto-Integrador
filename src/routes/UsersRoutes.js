const express = require('express');
const usersController = require ('../controllers/UserController');
const router = express.Router();

router.get ('/perfil', usersController.showPerfil)

module.exports = router;

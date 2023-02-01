const express = require("express");
const HomeController = require("../controllers/HomeController");
const router = express.Router();

router.get("/", HomeController.showCheckAge);
router.get("/idade_recusada", HomeController.showAgeDeclined);
router.get("/index", HomeController.showHome);
module.exports = router;

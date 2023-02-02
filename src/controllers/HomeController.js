const catalogo = require('../model/catalogo-produtos');

const homeController = {
    showHome: (req,res) =>{
        res.render('index')
    },
    showLojas: (req,res) =>{
        res.render('lojas')
    },
    showCatalogo: (req,res) =>{
        res.render('catalogo')
    },
    showContato: (req,res) =>{
        res.render('contato')
    },
    showTermos: (req,res) =>{
        res.render('termos')
    }
};
module.exports = homeController;

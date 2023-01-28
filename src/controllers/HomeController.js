const catalogo = require('../model/catalogo-produtos');

const homeController = {
    showHome: (req,res) =>{
        res.render('index')
    },
    showLojas: (req,res) =>{
        res.render('lojas')
    },
    showCatalogo: (req,res) =>{
        //Buscando os produtos no model
        const produtos = catalogo.findAll();

        //Renderizando a view catalogo e passando os produtos
        res.render('catalogo', {produtos});
    },
    showContato: (req,res) =>{
        res.render('contato')
    },
    showTermos: (req,res) =>{
        res.render('termos')
    }
}
module.exports = homeController;
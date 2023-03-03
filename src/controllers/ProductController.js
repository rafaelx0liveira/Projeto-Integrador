const catalogo = require('../model/catalogo-produtos');

const productRouter = {
    showProduct: (req,res) =>{
        const id = req.params.id;
        const produto = catalogo.findByPk(id);
        const produtos = catalogo.findAll();

        res.render('produto', {produto, produtos});
    }
}

module.exports = productRouter;
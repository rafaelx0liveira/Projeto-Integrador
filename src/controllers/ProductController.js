const {Produto} = require("../model")

const productRouter = {
    showProduct: async (req,res) =>{
        const id = req.params.id;
        const produto = await Produto.findByPk(id);
        console.log(produto)
        res.render('produto', {produto});
    }
}

module.exports = productRouter;
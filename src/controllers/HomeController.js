const homeController = {
    showHome: (req,res) =>{
        res.render('index')
    },
    showCarrinho: (req,res) =>{
        res.render ('carrinho')
    }
    
}

module.exports = homeController
const homeController = {
    showHome: (req,res) =>{
        res.render('index')
    },
    showLojas: (req,res) =>{
        res.render('lojas')
    },
    showCatalogo: (req,res) =>{
        res.render('catalogo')
    }
}
module.exports = homeController
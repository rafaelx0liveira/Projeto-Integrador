const homeController = {
    showHome: (req,res) =>{
        res.render('index')
    },
    showLojas: (req,res) =>{
        res.render('lojas')
    }
}
module.exports = homeController
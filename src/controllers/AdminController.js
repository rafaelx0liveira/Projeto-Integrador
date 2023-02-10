const AdminController = {
    showLoginAdmin: (req, res)=>{
        res.render("admin/login");
    },
    showDashAdmin: (req, res)=>{
        res.render("admin/index");
    },
    showProdutosAdmin: (req, res)=>{
        res.render("admin/produtos");
    },
}

module.exports = AdminController;
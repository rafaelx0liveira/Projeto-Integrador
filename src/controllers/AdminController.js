const AdminController = {
    showLoginAdmin: (req, res)=>{
        res.render("admin/login.ejs");
    },
    showDashAdmin: (req, res)=>{
        res.render("admin/index.ejs");
    },
}

module.exports = AdminController;
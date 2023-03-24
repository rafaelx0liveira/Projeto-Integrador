const isAdmin = (req, res, next) => {
    // const { user } = req.session;
    console.log(req.body);
    return next()
    // if (user) {
    //     
    // }

    // return res.redirect("/admin/login")
  }
  
  module.exports = isAdmin;
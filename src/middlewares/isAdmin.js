const isAdmin = (req, res, next) => {
  const { user } = req.session;

  if (user.is_admin) {
      return next()
  }

    return res.redirect("/admin/login")
}
  
  module.exports = isAdmin;
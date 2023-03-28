const CarrinhoController = {
  showCarrinho: (req, res) => {

    if(!req.session.user){
      return res.redirect('/login')
    }

    const { carrinho } = req.session.user;

    let total = 0;

    // Verifica se o carrinho está vazio
    if(!carrinho) {
      return res.render('carrinho', { carrinho:[], total });
    }

    // Se houver produto no carrinho, calcula o total
    carrinho.forEach((produto) => {
      // Construtor Number() converte o valor para um número
      total += Number(produto.preco);
    })   
    
    return res.render('carrinho', {carrinho, total});

  },
  addProduto: (req, res) =>{
    
    const {idProduto, nome, preco, imagem} = req.body

    const produto = {idProduto, nome, preco, imagem}

    if(!req.session.user){
      return res.redirect('/login/?shop=true')
    }    

    if(req.session.user.carrinho){
      req.session.user.carrinho.push(produto)
    }else{
      req.session.user.carrinho = [produto]
    }

    return res.redirect('/carrinho')

  }

}


module.exports = CarrinhoController;
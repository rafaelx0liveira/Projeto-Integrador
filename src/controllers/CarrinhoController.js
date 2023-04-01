const CarrinhoController = {
  showCarrinho: (req, res) => {

    if(!req.session.user){
      return res.redirect('/login')
    }

    const {carrinho,usuarioEndereco} = req.session.user;
    const endereco = usuarioEndereco[0];
    
    let total = 0;

    // Verifica se o carrinho está vazio
    if(!carrinho) {
      return res.render('carrinho', { carrinho:[],total, endereco:[]});
    }

    // Se houver produto no carrinho, calcula o total
    carrinho.forEach((produto) => {
      // Construtor Number() converte o valor para um número
      total += Number(produto.preco);
    })   
        
    return res.render('carrinho', {carrinho, total,endereco});

  },
  addProduto: (req, res) =>{
    
    const {idProduto, nome, preco, imagem,quantidade} = req.body

    const produto = {idProduto, nome, preco, imagem,quantidade}

    if(!req.session.user){
      return res.redirect('/login?shop=true')
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
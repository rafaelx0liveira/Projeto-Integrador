//Importando as dependências
const db = require('../database/db.json');
const fs = require('fs');
const path = require('path');
const crypto = require('crypto');

const catalogo = {
  findAll: () => {
    const produtos = [];

    db.products.map(produto => {
      produtos.push({
        id: produto.id,
        nome: produto.name,
        preco: `R$ ${produto.price.toLocaleString("pt-BR", { currency: "BRL", minimumFractionDigits: 2 })}`,
        descricao: produto.description,
        imagem: produto.image
        });
    });

    return produtos;
  }
}

module.exports = catalogo;
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
        descricao: produto.description,
        preco: `R$ ${produto.price.toLocaleString("pt-BR", { currency: "BRL", minimumFractionDigits: 2 })}`,
        imagem: produto.image,
        estoque: produto.stock,
        alcoolico: produto.alcoholic
        });
    });

    return produtos;
  }
}

module.exports = catalogo;
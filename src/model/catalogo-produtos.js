//Importando as dependências
const db = require('../database/db.json');
const fs = require('fs');
const path = require('path');
const crypto = require('crypto');

const catalogo = {

  //Função para buscar todos os produtos
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
        alcoolico: produto.alcoholic,
        tipo: produto.type
        });
    });

    return produtos;
  },

  //Função para buscar um produto pelo id
  findByPk: (id) => {
    const produto = db.products.find(produto => produto.id == id);

    const produtoFormatado = {
      id: produto.id,
      nome: produto.name,
      descricao: produto.description,
      preco: `R$ ${produto.price.toLocaleString("pt-BR", { currency: "BRL", minimumFractionDigits: 2 })}`,
      imagem: produto.image,
      estoque: produto.stock,
      alcoolico: produto.alcoholic,
      tipo: produto.type
    };

    return produtoFormatado;
  }
}

module.exports = catalogo;
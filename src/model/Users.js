// Importando as dependências
const crypto = require('crypto');
const fs = require('fs');
const path = require('path');
const db = require('../database/db.json');

const Users = {

    // Método para achar o usuário
    findUser: function (email) {
      const user = db.users.find((user) => user.email === email); 
      return user;
    },

    // Método para criar um novo usuário
    create: function (user) {

      // Criando um id para o usuário
        const newUser = {
          id: user.id = crypto.randomUUID(),
          email: user.email,
          cpf: user.cpf,
          nome: user.nome,
          telefone: user.telefone,
          dtNascimento: user.dtNascimento,
          senha: user.hash,
          cep: user.cep,
          rua: user.rua,
          numero: user.numero,
          bairro: user.bairro,
          cidade: user.cidade,
          complemento: user.complemento,
          noticias: user.noticias ? user.noticias : false,
          isAdmin: false
    }
    db.users.push(newUser);
    const data = JSON.stringify(db, null, 4);
    fs.writeFileSync(path.resolve("src", "database", "db.json"), data, "utf-8");
  }
}

module.exports = Users;
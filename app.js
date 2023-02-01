const express = require('express');
const path = require('path');
const homeRouter = require('./src/routes/HomeRoutes');
const usersRouter = require ('./src/routes/UsersRoutes')
const productsRouter = require ('./src/routes/ProductsRoutes')
const authRouter = require('./src/routes/AuthRouter');
const AdminRouter = require('./src/routes/AdminRouter');


// Variáveis
const app = express();
const port = 3000;

//Configurações / Middlewares
app.set('view engine', 'ejs');

// Configuração do caminho das views
app.set('views', path.resolve("src", 'views'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

// Arquivos estáticos
app.use(express.static(path.resolve("src", "public")));

// Rotas
app.use(homeRouter);

app.use(usersRouter)
app.use (productsRouter)

app.use(authRouter);
app.use("/admin", AdminRouter);


app.listen(port, () => {
    console.log('Listening on port 3000');
});

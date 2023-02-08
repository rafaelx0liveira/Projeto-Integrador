//Importando as dependências
const express = require('express');
const path = require('path');
const homeRouter = require('./src/routes/HomeRoutes');
const productRouter = require('./src/routes/ProductRoutes');
const authRouter = require('./src/routes/AuthRouter');
const session = require('express-session');
//const AdminRouter = require('./routes/admin');


// Variáveis
const app = express();
const port = 3000;

//Configurações / Middlewares
app.set('view engine', 'ejs');

// Configuração do caminho das views
app.set('views', path.resolve("src", 'views'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.use(session({
    secret: 'keyboard cat',
    resave: false,
    saveUninitialized: true,
}));

// Arquivos estáticos
app.use(express.static(path.resolve("src", "public")));

// Rotas
app.use(homeRouter);
app.use(productRouter);
app.use(authRouter);
//app.use("/admin", AdminRouter);


app.use((req, res, next) => {
    res.status(404).render('404');
});


app.listen(port, () => {
    console.log(`http://localhost:${port}`);
});
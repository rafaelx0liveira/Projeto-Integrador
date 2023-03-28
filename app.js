//Importando as dependências
const express = require("express");
const path = require("path");
const homeRouter = require("./src/routes/HomeRoutes");
const productRouter = require("./src/routes/ProductRoutes");
const authRouter = require("./src/routes/AuthRouter");
const AdminRouter = require("./src/routes/AdminRouter");
const userRouter = require("./src/routes/UsersRoutes");
const carrinhoRouter = require("./src/routes/CarrinhoRouter");

const session = require("express-session");
const methodOverride = require("method-override");

// Variáveis
const app = express();
const port = 3000;

//Configurações / Middlewares
app.set("view engine", "ejs");

// Configuração do caminho das views
app.set("views", path.resolve("src", "views"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.use(
  session({
    secret: "keyboard cat",
    resave: false,
    saveUninitialized: true,
  })
);

app.use(methodOverride("_method"));

// Arquivos estáticos
app.use(express.static(path.resolve("src", "public")));

// Rotas
app.use(userRouter);
app.use(homeRouter);
app.use(authRouter);
app.use(productRouter);
app.use(carrinhoRouter);
app.use("/admin", AdminRouter);

app.use((req, res, next) => {
  res.status(404).render("404");
});

app.listen(port, () => {
  console.log(`http://localhost:${port}`);
});

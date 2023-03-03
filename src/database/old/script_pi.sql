-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
--        SCRIPT DE CRIAÇÃOD DO BANCO DE DADOS
-- -----------------------------------------------------

USE `pi_dh` ;
-- -----------------------------------------------------
-- Table `pi_dh`.`Produto`
-- -----------------------------------------------------
CREATE TABLE Produto(
 `idProduto` INT NOT NULL ,
 `nome` VARCHAR(100) NOT NULL,
 `descricao` VARCHAR(250) NOT NULL,
 `preco` DECIMAL NOT NULL,
 `alcoolico` TINYINT NOT NULL,
 `imagem` VARCHAR(100) NOT NULL,
 `ativo` TINYINT NOT NULL,
 `estoque` TINYINT NOT NULL,
 `ingredientes` VARCHAR(250) NOT NULL,
 `harmonizacao` VARCHAR(300) NOT NULL,
 `graduacao_alcoolica` DECIMAL NOT NULL,
 `volume` DECIMAL NOT NULL,
 PRIMARY KEY (`idProduto`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `pi_dh`.`Usuario`
-- -----------------------------------------------------

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `dtNascimento` date NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB;


-- -----------------------------------------------------
-- Table `pi_dh`.`Endereco`
-- -----------------------------------------------------

CREATE TABLE Endereco (
  `idEndereco` INT NOT NULL,
  `rua` VARCHAR(100) NOT NULL,
  `cep` VARCHAR(8) NOT NULL,
  `numero` INT NOT NULL,
  `bairro` VARCHAR(50) NOT NULL,
  `cidade` VARCHAR(50) NOT NULL,
  `complemento` VARCHAR(50) NOT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idEndereco`, `Usuario_idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pi_dh`.`Pagamentos`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Pagamentos (
  `idPagamentos` INT NOT NULL,
  `cartao` VARCHAR(20) NOT NULL,
  `validade` DATE NOT NULL,
  `cv` INT(3) NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idPagamentos`, `Usuario_idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pi_dh`.`Pedido`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Pedido (
  `idPedido` INT NOT NULL,
  `valor_total` DECIMAL NOT NULL,
  `data_pedido` DATE NOT NULL,
  `tipo_pagamento` VARCHAR(50) NOT NULL,
  `status` ENUM('em andamento', 'pago', 'expirado', 'cancelado') NOT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  `Pagamentos_idPagamentos` INT NOT NULL,
  PRIMARY KEY (`idPedido`, `Usuario_idUsuario`, `Pagamentos_idPagamentos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pi_dh`.`Pedido_has_Produto`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Pedido_has_Produto (
  `Pedido_idPedido` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  PRIMARY KEY (`Pedido_idPedido`, `Produto_idProduto`))
ENGINE = InnoDB;


-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema banco_pi
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produto` (
  `idProduto` INT NOT NULL AUTO_INCREMENT,
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
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  idUsuario INT NOT NULL,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(50) NOT NULL,
  cpf VARCHAR(11) NOT NULL,
  telefone VARCHAR(45) NOT NULL,
  dtNascimento DATE NOT NULL,
  PRIMARY KEY (idUsuario),
  UNIQUE INDEX `email_UNIQUE` (email ASC) VISIBLE,
  UNIQUE INDEX `cpf_UNIQUE` (cpf ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Endereco` (
  `idEndereco` INT NOT NULL,
  `rua` VARCHAR(100) NOT NULL,
  `cep` VARCHAR(8) NOT NULL,
  `numero` INT NOT NULL,
  `bairro` VARCHAR(50) NOT NULL,
  `cidade` VARCHAR(50) NOT NULL,
  `complemento` VARCHAR(50) NOT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idEndereco`, `Usuario_idUsuario`),
  INDEX `fk_Endereco_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Endereco_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `mydb`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pagamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pagamentos` (
  `idPagamentos` INT NOT NULL,
  `cartao` VARCHAR(20) NOT NULL,
  `validade` DATE NOT NULL,
  `cv` INT(3) NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idPagamentos`, `Usuario_idUsuario`),
  INDEX `fk_Pagamentos_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Pagamentos_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `mydb`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pedido` (
  `idPedido` INT NOT NULL,
  `valor_total` DECIMAL NOT NULL,
  `data_pedido` DATE NOT NULL,
  `tipo_pagamento` VARCHAR(50) NOT NULL,
  `status` ENUM('em andamento', 'pago', 'expirado', 'cancelado') NOT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  `Pagamentos_idPagamentos` INT NOT NULL,
  PRIMARY KEY (`idPedido`, `Usuario_idUsuario`, `Pagamentos_idPagamentos`),
  INDEX `fk_Pedido_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  INDEX `fk_Pedido_Pagamentos1_idx` (`Pagamentos_idPagamentos` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `mydb`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Pagamentos1`
    FOREIGN KEY (`Pagamentos_idPagamentos`)
    REFERENCES `mydb`.`Pagamentos` (`idPagamentos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pedido_has_Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pedido_has_Produto` (
  `Pedido_idPedido` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  PRIMARY KEY (`Pedido_idPedido`, `Produto_idProduto`),
  INDEX `fk_Pedido_has_Produto_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  INDEX `fk_Pedido_has_Produto_Pedido_idx` (`Pedido_idPedido` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_has_Produto_Pedido`
    FOREIGN KEY (`Pedido_idPedido`)
    REFERENCES `mydb`.`Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_has_Produto_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

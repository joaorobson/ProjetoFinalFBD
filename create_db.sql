-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`MUNICIPIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MUNICIPIO` (
  `COD_MUNICIPIO` INT NOT NULL,
  `NOME` VARCHAR(50) NULL,
  `UF` VARCHAR(2) NULL,
  `REGIAO` VARCHAR(50) NULL,
  PRIMARY KEY (`COD_MUNICIPIO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`INSTITUICAO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`INSTITUICAO` (
  `COD_INSTITUICAO` INT NOT NULL,
  `NOME_INSTITUICAO` VARCHAR(150) NULL,
  `SIGLA` VARCHAR(50) NULL,
  `CATEGORIA` VARCHAR(50) NULL,
  `ORGANIZACAO_ACADEMICA` VARCHAR(50) NULL,
  `SITUACAO` VARCHAR(50) NULL,
  `PERCENTUAL_DOCENTES_MESTRADO` FLOAT NULL,
  `PERCENTUAL_DOCENTES_DOUTORADO` FLOAT NULL,
  `COD_MUNICIPIO` INT NOT NULL,
  PRIMARY KEY (`COD_INSTITUICAO`),
  INDEX `fk_INSTITUICAO_MUNICIPIO1_idx` (`COD_MUNICIPIO` ASC),
  CONSTRAINT `fk_INSTITUICAO_MUNICIPIO1`
    FOREIGN KEY (`COD_MUNICIPIO`)
    REFERENCES `mydb`.`MUNICIPIO` (`COD_MUNICIPIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CURSO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CURSO` (
  `COD_CURSO` INT NOT NULL,
  `NOME_CURSO` VARCHAR(200) NULL,
  `GRAU` VARCHAR(50) NULL,
  `MODALIDADE` VARCHAR(50) NULL,
  `SITUACAO` VARCHAR(50) NULL,
  `CARGA_HORARIA` INT NULL,
  `VAGAS_AUTORIZADAS` INT NULL,
  `COD_INSTITUICAO` INT NOT NULL,
  `CONCEITO_ENADE` FLOAT NULL,
  `AREA_CURSO` VARCHAR(150) NULL,
  PRIMARY KEY (`COD_CURSO`),
  INDEX `fk_CURSO_INSTITUICAO_idx` (`COD_INSTITUICAO` ASC),
  CONSTRAINT `fk_CURSO_INSTITUICAO`
    FOREIGN KEY (`COD_INSTITUICAO`)
    REFERENCES `mydb`.`INSTITUICAO` (`COD_INSTITUICAO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MUNICIPIO_has_CURSO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MUNICIPIO_has_CURSO` (
  `MUNICIPIO_COD_MUNICIPIO` INT NOT NULL,
  `CURSO_COD_CURSO` INT NOT NULL,
  PRIMARY KEY (`MUNICIPIO_COD_MUNICIPIO`, `CURSO_COD_CURSO`),
  INDEX `fk_MUNICIPIO_has_CURSO_CURSO1_idx` (`CURSO_COD_CURSO` ASC),
  INDEX `fk_MUNICIPIO_has_CURSO_MUNICIPIO1_idx` (`MUNICIPIO_COD_MUNICIPIO` ASC),
  CONSTRAINT `fk_MUNICIPIO_has_CURSO_MUNICIPIO1`
    FOREIGN KEY (`MUNICIPIO_COD_MUNICIPIO`)
    REFERENCES `mydb`.`MUNICIPIO` (`COD_MUNICIPIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MUNICIPIO_has_CURSO_CURSO1`
    FOREIGN KEY (`CURSO_COD_CURSO`)
    REFERENCES `mydb`.`CURSO` (`COD_CURSO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
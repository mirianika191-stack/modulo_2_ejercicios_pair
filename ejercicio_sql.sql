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
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuarios` (
  `idusuarios` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `fecha_registro` DATE NOT NULL,
  PRIMARY KEY (`idusuarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`libros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`libros` (
  `id_libros` INT NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `año_publi` DATE NOT NULL,
  `categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_libros`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`autoras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`autoras` (
  `idautoras` INT NOT NULL,
  `nombres` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `nacinalidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idautoras`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`prestamos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`prestamos` (
  `idprestamos` INT NOT NULL,
  `fecha_retiro` DATE NOT NULL,
  `fecha_devolucion` DATE NOT NULL,
  `usuarios_idusuarios` INT NOT NULL,
  PRIMARY KEY (`idprestamos`, `usuarios_idusuarios`),
  INDEX `fk_prestamos_usuarios1_idx` (`usuarios_idusuarios` ASC) VISIBLE,
  CONSTRAINT `fk_prestamos_usuarios1`
    FOREIGN KEY (`usuarios_idusuarios`)
    REFERENCES `mydb`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`libros_has_autoras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`libros_has_autoras` (
  `libros_id_libros` INT NOT NULL,
  `autoras_idautoras` INT NOT NULL,
  PRIMARY KEY (`libros_id_libros`, `autoras_idautoras`),
  INDEX `fk_libros_has_autoras_autoras1_idx` (`autoras_idautoras` ASC) VISIBLE,
  INDEX `fk_libros_has_autoras_libros_idx` (`libros_id_libros` ASC) VISIBLE,
  CONSTRAINT `fk_libros_has_autoras_libros`
    FOREIGN KEY (`libros_id_libros`)
    REFERENCES `mydb`.`libros` (`id_libros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_libros_has_autoras_autoras1`
    FOREIGN KEY (`autoras_idautoras`)
    REFERENCES `mydb`.`autoras` (`idautoras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`libros_has_prestamos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`libros_has_prestamos` (
  `libros_id_libros` INT NOT NULL,
  `prestamos_idprestamos` INT NOT NULL,
  `prestamos_usuarios_idusuarios` INT NOT NULL,
  PRIMARY KEY (`libros_id_libros`, `prestamos_idprestamos`, `prestamos_usuarios_idusuarios`),
  INDEX `fk_libros_has_prestamos_prestamos1_idx` (`prestamos_idprestamos` ASC, `prestamos_usuarios_idusuarios` ASC) VISIBLE,
  INDEX `fk_libros_has_prestamos_libros1_idx` (`libros_id_libros` ASC) VISIBLE,
  CONSTRAINT `fk_libros_has_prestamos_libros1`
    FOREIGN KEY (`libros_id_libros`)
    REFERENCES `mydb`.`libros` (`id_libros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_libros_has_prestamos_prestamos1`
    FOREIGN KEY (`prestamos_idprestamos` , `prestamos_usuarios_idusuarios`)
    REFERENCES `mydb`.`prestamos` (`idprestamos` , `usuarios_idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Script generated by MySQL Workbench
-- jue 15 nov 2018 12:33:02 WET
-- Model: New Model    Version: 1.0
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
-- Table `mydb`.`Vivero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vivero` (
  `Cod` INT NOT NULL,
  `localidad` VARCHAR(45) NULL,
  PRIMARY KEY (`Cod`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Zona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Zona` (
  `Cod` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `producto` VARCHAR(45) NULL,
  PRIMARY KEY (`Cod`, `nombre`),
  CONSTRAINT `Cod`
    FOREIGN KEY (`Cod`)
    REFERENCES `mydb`.`Vivero` (`Cod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empleado` (
  `DNI` INT NOT NULL,
  `fecha_in` DATE NOT NULL,
  `sueldo` INT NULL,
  `css` VARCHAR(45) NULL,
  `producto` VARCHAR(45) NULL,
  `Cod` INT NULL,
  `nombre` VARCHAR(45) NULL,
  `fecha_fin` DATE NULL,
  `ventas` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`, `fecha_in`),
  INDEX `Cod_idx` (`Cod` ASC),
  INDEX `nombre_idx` (`nombre` ASC),
  CONSTRAINT `Cod`
    FOREIGN KEY (`Cod`)
    REFERENCES `mydb`.`Zona` (`Cod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `nombre`
    FOREIGN KEY (`nombre`)
    REFERENCES `mydb`.`Zona` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `DNI` INT NOT NULL,
  `Bonificacion` VARCHAR(45) NULL,
  `total_ventas` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Producto` (
  `Cod` INT NOT NULL,
  `stack` VARCHAR(45) NULL,
  `precio` INT NULL,
  PRIMARY KEY (`Cod`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Producto_Empleado_Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Producto_Empleado_Cliente` (
  `DNI_e` INT NOT NULL,
  `DNI_C` INT NOT NULL,
  `Cod_p` INT NOT NULL,
  `Cant` INT NULL,
  `fecha` DATE NULL,
  PRIMARY KEY (`DNI_e`, `DNI_C`, `Cod_p`),
  INDEX `DNI_C_idx` (`DNI_C` ASC),
  INDEX `Cod_p_idx` (`Cod_p` ASC),
  CONSTRAINT `DNI_e`
    FOREIGN KEY (`DNI_e`)
    REFERENCES `mydb`.`Empleado` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `DNI_C`
    FOREIGN KEY (`DNI_C`)
    REFERENCES `mydb`.`Cliente` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Cod_p`
    FOREIGN KEY (`Cod_p`)
    REFERENCES `mydb`.`Producto` (`Cod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb_karinaMeza
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb_karinaMeza
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb_karinaMeza` DEFAULT CHARACTER SET utf8 ;
USE `mydb_karinaMeza` ;

-- -----------------------------------------------------
-- Table `mydb_karinaMeza`.`encabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb_karinaMeza`.`encabezado` (
  `idEncabezado` INT NOT NULL AUTO_INCREMENT,
  `fullName` VARCHAR(45) NOT NULL,
  `tituloEncabezado` VARCHAR(45) NOT NULL,
  `avatarImg` VARCHAR(45) NOT NULL,
  `acercaDe` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`idEncabezado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb_karinaMeza`.`school`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb_karinaMeza`.`school` (
  `idSchool` INT NOT NULL AUTO_INCREMENT,
  `school` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSchool`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb_karinaMeza`.`title`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb_karinaMeza`.`title` (
  `idTitle` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTitle`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb_karinaMeza`.`educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb_karinaMeza`.`educacion` (
  `idEducacion` INT NOT NULL AUTO_INCREMENT,
  `resume` VARCHAR(300) NOT NULL,
  `idEncabezado` INT NOT NULL,
  `idSchool` INT NOT NULL,
  `idTitle` INT NOT NULL,
  PRIMARY KEY (`idEducacion`),
  INDEX `fk_educacion_encabezado_idx` (`idEncabezado` ASC) VISIBLE,
  INDEX `fk_educacion_school1_idx` (`idSchool` ASC) VISIBLE,
  INDEX `fk_educacion_title1_idx` (`idTitle` ASC) VISIBLE,
  CONSTRAINT `fk_educacion_encabezado`
    FOREIGN KEY (`idEncabezado`)
    REFERENCES `mydb_karinaMeza`.`encabezado` (`idEncabezado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_educacion_school1`
    FOREIGN KEY (`idSchool`)
    REFERENCES `mydb_karinaMeza`.`school` (`idSchool`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_educacion_title1`
    FOREIGN KEY (`idTitle`)
    REFERENCES `mydb_karinaMeza`.`title` (`idTitle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb_karinaMeza`.`empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb_karinaMeza`.`empresa` (
  `idEmpresa` INT NOT NULL AUTO_INCREMENT,
  `empresa` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEmpresa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb_karinaMeza`.`tipoExperiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb_karinaMeza`.`tipoExperiencia` (
  `idTipoExperiencia` INT NOT NULL AUTO_INCREMENT,
  `tipoExperiencia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoExperiencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb_karinaMeza`.`experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb_karinaMeza`.`experiencia` (
  `idExperiencia` INT NOT NULL AUTO_INCREMENT,
  `detalleDeExperiencia` VARCHAR(45) NOT NULL,
  `idEncabezado` INT NOT NULL,
  `idEmpresa` INT NOT NULL,
  `idTipoExperiencia` INT NOT NULL,
  PRIMARY KEY (`idExperiencia`),
  INDEX `fk_experiencia_encabezado1_idx` (`idEncabezado` ASC) VISIBLE,
  INDEX `fk_experiencia_empresa1_idx` (`idEmpresa` ASC) VISIBLE,
  INDEX `fk_experiencia_tipoExperiencia1_idx` (`idTipoExperiencia` ASC) VISIBLE,
  CONSTRAINT `fk_experiencia_encabezado1`
    FOREIGN KEY (`idEncabezado`)
    REFERENCES `mydb_karinaMeza`.`encabezado` (`idEncabezado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_experiencia_empresa1`
    FOREIGN KEY (`idEmpresa`)
    REFERENCES `mydb_karinaMeza`.`empresa` (`idEmpresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_experiencia_tipoExperiencia1`
    FOREIGN KEY (`idTipoExperiencia`)
    REFERENCES `mydb_karinaMeza`.`tipoExperiencia` (`idTipoExperiencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb_karinaMeza`.`skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb_karinaMeza`.`skills` (
  `idSkills` INT NOT NULL AUTO_INCREMENT,
  `skillName` VARCHAR(45) NOT NULL,
  `score` SMALLINT(3) NOT NULL,
  `idEncabezado` INT NOT NULL,
  PRIMARY KEY (`idSkills`),
  INDEX `fk_skills_encabezado1_idx` (`idEncabezado` ASC) VISIBLE,
  CONSTRAINT `fk_skills_encabezado1`
    FOREIGN KEY (`idEncabezado`)
    REFERENCES `mydb_karinaMeza`.`encabezado` (`idEncabezado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb_karinaMeza`.`projects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb_karinaMeza`.`projects` (
  `idProjects` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `imgProject` VARCHAR(45) NOT NULL,
  `description` VARCHAR(300) NOT NULL,
  `idEncabezado` INT NOT NULL,
  PRIMARY KEY (`idProjects`),
  INDEX `fk_projects_encabezado1_idx` (`idEncabezado` ASC) VISIBLE,
  CONSTRAINT `fk_projects_encabezado1`
    FOREIGN KEY (`idEncabezado`)
    REFERENCES `mydb_karinaMeza`.`encabezado` (`idEncabezado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb_karinaMeza`.`contacto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb_karinaMeza`.`contacto` (
  `idContact` INT NOT NULL AUTO_INCREMENT,
  `mail` VARCHAR(45) NOT NULL,
  `nameUbication` VARCHAR(45) NOT NULL,
  `idEncabezado` INT NOT NULL,
  PRIMARY KEY (`idContact`),
  INDEX `fk_contacto_encabezado1_idx` (`idEncabezado` ASC) VISIBLE,
  CONSTRAINT `fk_contacto_encabezado1`
    FOREIGN KEY (`idEncabezado`)
    REFERENCES `mydb_karinaMeza`.`encabezado` (`idEncabezado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb_karinaMeza`.`school_has_title`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb_karinaMeza`.`school_has_title` (
  `idTitle` INT NOT NULL,
  PRIMARY KEY (`idTitle`),
  INDEX `fk_school_has_title_title1_idx` (`idTitle` ASC) VISIBLE,
  CONSTRAINT `fk_school_has_title_title1`
    FOREIGN KEY (`idTitle`)
    REFERENCES `mydb_karinaMeza`.`title` (`idTitle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb_karinaMeza`.`empresa_has_tipoExperiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb_karinaMeza`.`empresa_has_tipoExperiencia` (
  `idEmpresa` INT NOT NULL,
  `idTipoExperiencia` INT NOT NULL,
  PRIMARY KEY (`idEmpresa`, `idTipoExperiencia`),
  INDEX `fk_empresa_has_tipoExperiencia_tipoExperiencia1_idx` (`idTipoExperiencia` ASC) VISIBLE,
  INDEX `fk_empresa_has_tipoExperiencia_empresa1_idx` (`idEmpresa` ASC) VISIBLE,
  CONSTRAINT `fk_empresa_has_tipoExperiencia_empresa1`
    FOREIGN KEY (`idEmpresa`)
    REFERENCES `mydb_karinaMeza`.`empresa` (`idEmpresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empresa_has_tipoExperiencia_tipoExperiencia1`
    FOREIGN KEY (`idTipoExperiencia`)
    REFERENCES `mydb_karinaMeza`.`tipoExperiencia` (`idTipoExperiencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb_karinaMeza`.`school_has_school_has_title`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb_karinaMeza`.`school_has_school_has_title` (
  `idSchool` INT NOT NULL,
  `idTitle` INT NOT NULL,
  PRIMARY KEY (`idSchool`, `idTitle`),
  INDEX `fk_school_has_school_has_title_school_has_title1_idx` (`idTitle` ASC) VISIBLE,
  INDEX `fk_school_has_school_has_title_school1_idx` (`idSchool` ASC) VISIBLE,
  CONSTRAINT `fk_school_has_school_has_title_school1`
    FOREIGN KEY (`idSchool`)
    REFERENCES `mydb_karinaMeza`.`school` (`idSchool`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_school_has_school_has_title_school_has_title1`
    FOREIGN KEY (`idTitle`)
    REFERENCES `mydb_karinaMeza`.`school_has_title` (`idTitle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

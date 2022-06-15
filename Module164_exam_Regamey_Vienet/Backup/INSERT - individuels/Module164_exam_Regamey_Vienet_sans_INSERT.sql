SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Module164_exam_Regamey_Vienet
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Module164_exam_Regamey_Vienet` DEFAULT CHARACTER SET utf8 ;
USE `Module164_exam_Regamey_Vienet` ;
-- -----------------------------------------------------
-- Table `Module164_exam_Regamey_Vienet`.`Clients`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Module164_exam_Regamey_Vienet`.`Clients` ;

-- IL FAUT AVOIR 5 CHAMPS SUPPLEMENTAIRES
CREATE TABLE IF NOT EXISTS `Module164_exam_Regamey_Vienet`.`Clients` (
  `id_Client` INT NOT NULL AUTO_INCREMENT,
  -- INSERER ICI LES CHAMPS SUPPLEMENTAIRES
  PRIMARY KEY (`id_Client`),
  `nom_Client` VARCHAR(45) NOT NULL,
  `prenom_Client` VARCHAR(45) NOT NULL,
  `superhero` VARCHAR(45),
  `genre_Client` BOOLEAN NOT NULL ,
  `date_naissance_Client` DATE,
  `ville_Client` VARCHAR(90) NOT NULL,
  `tel_Client` VARCHAR(20));

-- -----------------------------------------------------
-- Table `Module164_exam_Regamey_Vienet`.`Fournisseurs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Module164_exam_Regamey_Vienet`.`Fournisseurs` ;

-- IL FAUT AVOIR 5 CHAMPS SUPPLEMENTAIRES
CREATE TABLE IF NOT EXISTS `Module164_exam_Regamey_Vienet`.`Fournisseurs` (
  `id_Fournisseur` INT NOT NULL AUTO_INCREMENT,
  -- INSERER ICI LES CHAMPS SUPPLEMENTAIRES
  PRIMARY KEY (`id_Fournisseur`),
  `nom_Fournisseur` VARCHAR(90) NOT NULL,
  `adresse_Fournisseur` VARCHAR(90) NOT NULL,
  `tel_Fournisseur` VARCHAR(20) NOT NULL,
  `email_Fournisseur` VARCHAR(90),
  `date_creation_Fournisseur` DATE NOT NULL);

-- -----------------------------------------------------
-- Table `Module164_exam_Regamey_Vienet`.`LEGO_Themes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Module164_exam_Regamey_Vienet`.`LEGO_Themes` ;

CREATE TABLE IF NOT EXISTS `Module164_exam_Regamey_Vienet`.`LEGO_Themes` (
  `id_LEGO_Theme` INT NOT NULL AUTO_INCREMENT,
  `nom_LEGO_Theme` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_LEGO_Theme`));


-- -----------------------------------------------------
-- Table `Module164_exam_Regamey_Vienet`.`LEGO_Categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Module164_exam_Regamey_Vienet`.`LEGO_Categories` ;

CREATE TABLE IF NOT EXISTS `Module164_exam_Regamey_Vienet`.`LEGO_Categories` (
  `id_LEGO_Categorie_Impose` INT NOT NULL,
  `nom_LEGO_Categorie` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id_LEGO_Categorie_Impose`));


-- -----------------------------------------------------
-- Table `Module164_exam_Regamey_Vienet`.`LEGO_Couleurs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Module164_exam_Regamey_Vienet`.`LEGO_Couleurs` ;

CREATE TABLE IF NOT EXISTS `Module164_exam_Regamey_Vienet`.`LEGO_Couleurs` (
  `id_Couleur` INT NOT NULL AUTO_INCREMENT,
  `nom_LEGO_Couleur` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Couleur`));


-- -----------------------------------------------------
-- Table `Module164_exam_Regamey_Vienet`.`Magasins`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Module164_exam_Regamey_Vienet`.`Magasins` ;

-- IL FAUT AVOIR 5 CHAMPS SUPPLEMENTAIRES
CREATE TABLE IF NOT EXISTS `Module164_exam_Regamey_Vienet`.`Magasins` (
  `id_Magasin` INT NOT NULL AUTO_INCREMENT,
  -- INSERER ICI LES CHAMPS SUPPLEMENTAIRES
  PRIMARY KEY (`id_Magasin`),
  `nom_Magasin` VARCHAR(90) NOT NULL,
  `adresse_Magasin` VARCHAR(90) NOT NULL,
  `tel_Magasin` VARCHAR(20),
  `email_Magasin` VARCHAR(90),
  `siteweb_Magasin` VARCHAR(90));


-- -----------------------------------------------------
-- Table `Module164_exam_Regamey_Vienet`.`LEGO_Pieces`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Module164_exam_Regamey_Vienet`.`LEGO_Pieces` ;

CREATE TABLE IF NOT EXISTS `Module164_exam_Regamey_Vienet`.`LEGO_Pieces` (
  `id_LEGO_Piece` INT NOT NULL,
  `nom_LEGO_Piece` VARCHAR(45) NOT NULL,
  `id_LEGO_Categorie_Impose` INT NOT NULL,
  PRIMARY KEY (`id_LEGO_Piece`),
    FOREIGN KEY (`id_LEGO_Categorie_Impose`)
        REFERENCES `Module164_exam_Regamey_Vienet`.`LEGO_Categories` (`id_LEGO_Categorie_Impose`));


-- -----------------------------------------------------
-- Table `Module164_exam_Regamey_Vienet`.`LEGO_Sets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Module164_exam_Regamey_Vienet`.`LEGO_Sets` ;

CREATE TABLE IF NOT EXISTS `Module164_exam_Regamey_Vienet`.`LEGO_Sets` (
  `id_LEGO_Set` INT NOT NULL,
  `id_LEGO_Piece` INT NOT NULL,
  `quantite_Piece` INT NOT NULL,
  `id_LEGO_Theme` INT NOT NULL,
  `id_Couleur` INT NOT NULL,
  PRIMARY KEY (`id_LEGO_Set`,id_LEGO_Piece),
    FOREIGN KEY (`id_LEGO_Piece`)
        REFERENCES `Module164_exam_Regamey_Vienet`.`LEGO_Pieces` (`id_LEGO_Piece`),
    FOREIGN KEY (`id_LEGO_Theme`)
        REFERENCES `Module164_exam_Regamey_Vienet`.`LEGO_Themes` (`id_LEGO_Theme`),
    FOREIGN KEY (`id_Couleur`)
        REFERENCES `Module164_exam_Regamey_Vienet`.`LEGO_Couleurs` (`id_Couleur`));


-- -----------------------------------------------------
-- Table `Module164_exam_Regamey_Vienet`.`Stock`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Module164_exam_Regamey_Vienet`.`Stock` ;

CREATE TABLE IF NOT EXISTS `Module164_exam_Regamey_Vienet`.`Stock` (
  `id_Magasin` INT NOT NULL,
  `id_LEGO_Set` INT NOT NULL,
  `quantite_Stock` INT NOT NULL,
  `prix_Stock` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`id_Magasin`, `id_LEGO_Set`),
    FOREIGN KEY (`id_Magasin`)
        REFERENCES `Module164_exam_Regamey_Vienet`.`Magasins` (`id_Magasin`),
    FOREIGN KEY (`id_LEGO_Set`)
        REFERENCES `Module164_exam_Regamey_Vienet`.`LEGO_Sets` (`id_LEGO_Set`));


-- -----------------------------------------------------
-- Table `Module164_exam_Regamey_Vienet`.`Employés`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Module164_exam_Regamey_Vienet`.`Employes` ;

-- IL FAUT AVOIR 5 CHAMPS SUPPLEMENTAIRES
CREATE TABLE IF NOT EXISTS `Module164_exam_Regamey_Vienet`.`Employes` (
  `id_Employe` INT NOT NULL AUTO_INCREMENT,
  -- INSERER ICI LES CHAMPS SUPPLEMENTAIRES
  `nom_Employe` VARCHAR(45) NOT NULL,
  `prenom_Employe` VARCHAR(45) NOT NULL,
  `genre_Employe` BOOLEAN NOT NULL,
  `date_naissance_Employe` DATE NOT NULL,
  `adresse_Employe` VARCHAR(90) NOT NULL,
  `tel_Employe` VARCHAR(20),
  --
  `id_Magasin` INT NOT NULL,
  PRIMARY KEY (`id_Employe`),
    FOREIGN KEY (`id_Magasin`)
    REFERENCES `Module164_exam_Regamey_Vienet`.`Magasins` (`id_Magasin`));


-- -----------------------------------------------------
-- Table `Module164_exam_Regamey_Vienet`.`Commandes Fournisseurs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Module164_exam_Regamey_Vienet`.`Commandes Fournisseurs` ;

CREATE TABLE IF NOT EXISTS `Module164_exam_Regamey_Vienet`.`Commandes Fournisseurs` (
  `id_Commande_Fournisseur` INT NOT NULL AUTO_INCREMENT,
  `quantite` INT NOT NULL,
  `id_Fournisseur` INT NOT NULL,
  `id_LEGO_Set` INT NOT NULL,
  PRIMARY KEY (`id_Commande_Fournisseur`),
    FOREIGN KEY (`id_Fournisseur`)
        REFERENCES `Module164_exam_Regamey_Vienet`.`Fournisseurs` (`id_Fournisseur`),
    FOREIGN KEY (`id_LEGO_Set`)
        REFERENCES `Module164_exam_Regamey_Vienet`.`LEGO_Sets` (`id_LEGO_Set`));


-- -----------------------------------------------------
-- Table `Module164_exam_Regamey_Vienet`.`Commandes Clients`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Module164_exam_Regamey_Vienet`.`Commandes Clients` ;

CREATE TABLE IF NOT EXISTS `Module164_exam_Regamey_Vienet`.`Commandes Clients` (
  `id_Commande_Client` INT NOT NULL AUTO_INCREMENT,
  `id_Client` INT NOT NULL,
  `id_LEGO_Set` INT NOT NULL,
  `prix_Commande_Client` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`id_Commande_Client`),
    FOREIGN KEY (`id_Client`)
        REFERENCES `Module164_exam_Regamey_Vienet`.`Clients` (`id_Client`),
    FOREIGN KEY (`id_LEGO_Set`)
        REFERENCES `Module164_exam_Regamey_Vienet`.`LEGO_Sets` (`id_LEGO_Set`));


-- -----------------------------------------------------
-- Table `Module164_exam_Regamey_Vienet`.`Livraisons magasins clients`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Module164_exam_Regamey_Vienet`.`Livraisons magasins clients` ;

CREATE TABLE IF NOT EXISTS `Module164_exam_Regamey_Vienet`.`Livraisons magasins clients` (
  `id_Commande_Client` INT NOT NULL,
  `id_Magasin` INT NOT NULL,
  PRIMARY KEY (`id_Commande_Client`, `id_Magasin`),
    FOREIGN KEY (`id_Commande_Client`)
        REFERENCES `Module164_exam_Regamey_Vienet`.`Commandes Clients` (`id_Commande_Client`),
    FOREIGN KEY (`id_Magasin`)
        REFERENCES `Module164_exam_Regamey_Vienet`.`Magasins` (`id_Magasin`));


-- -----------------------------------------------------
-- Table `Module164_exam_Regamey_Vienet`.`Livraisons magasins fournisseurs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Module164_exam_Regamey_Vienet`.`Livraisons magasins fournisseurs` ;

CREATE TABLE IF NOT EXISTS `Module164_exam_Regamey_Vienet`.`Livraisons magasins fournisseurs` (
  `id_Commande_Fournisseur` INT NOT NULL,
  `id_Magasin` INT NOT NULL,
  PRIMARY KEY (`id_Commande_Fournisseur`, `id_Magasin`),
    FOREIGN KEY (`id_Commande_Fournisseur`)
        REFERENCES `Module164_exam_Regamey_Vienet`.`Commandes Fournisseurs` (`id_Commande_Fournisseur`),
    FOREIGN KEY (`id_Magasin`)
        REFERENCES `Module164_exam_Regamey_Vienet`.`Magasins` (`id_Magasin`));



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Script generated by MySQL Workbench
-- 05/17/14 11:23:32
-- Model: New Model    Version: 1.0
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema MOMANDPOP
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MOMANDPOP` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `MOMANDPOP` ;

-- -----------------------------------------------------
-- Table `MOMANDPOP`.`Customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MOMANDPOP`.`Customers` ;

CREATE TABLE IF NOT EXISTS `MOMANDPOP`.`Customers` (
  `CustomerID` INT NOT NULL,
  `CustomerName` VARCHAR(255) NULL,
  `ContactName` VARCHAR(255) NULL,
  `Address` VARCHAR(255) NULL,
  `City` VARCHAR(255) NULL,
  `State` VARCHAR(45) NULL,
  `PostalCode` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MOMANDPOP`.`Categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MOMANDPOP`.`Categories` ;

CREATE TABLE IF NOT EXISTS `MOMANDPOP`.`Categories` (
  `CategoryID` VARCHAR(45) NOT NULL,
  `Description` LONGTEXT NULL,
  `CategoryID` VARCHAR(45) NULL,
  PRIMARY KEY (`CategoryID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MOMANDPOP`.`Employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MOMANDPOP`.`Employees` ;

CREATE TABLE IF NOT EXISTS `MOMANDPOP`.`Employees` (
  `Employee ID` INT NOT NULL,
  `FirstName` VARCHAR(45) NULL,
  `LastName` VARCHAR(45) NULL,
  `BirthDate` DATE NOT NULL,
  `Photo` LONGBLOB NULL,
  `Notes` LONGTEXT NULL,
  `Employeescol` VARCHAR(45) NULL,
  PRIMARY KEY (`Employee ID`, `BirthDate`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MOMANDPOP`.`Order Details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MOMANDPOP`.`Order Details` ;

CREATE TABLE IF NOT EXISTS `MOMANDPOP`.`Order Details` (
  `OrderDetailID` VARCHAR(45) NOT NULL,
  `OrderID` VARCHAR(45) NOT NULL,
  `ProductID` VARCHAR(45) NULL,
  `Quantity` INT NULL,
  PRIMARY KEY (`OrderDetailID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MOMANDPOP`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MOMANDPOP`.`Orders` ;

CREATE TABLE IF NOT EXISTS `MOMANDPOP`.`Orders` (
  `OrderID` VARCHAR(45) NOT NULL,
  `CustomerID` VARCHAR(45) NULL,
  `EmployeeID` VARCHAR(45) NULL,
  `OrderDate` DATE NULL,
  `ShipperID` VARCHAR(45) NULL,
  PRIMARY KEY (`OrderID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MOMANDPOP`.`Products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MOMANDPOP`.`Products` ;

CREATE TABLE IF NOT EXISTS `MOMANDPOP`.`Products` (
  `ProductID` VARCHAR(45) NOT NULL,
  `ProductName` VARCHAR(45) NULL,
  `SupplierID` VARCHAR(45) NULL,
  `CategoryID` VARCHAR(45) NULL,
  PRIMARY KEY (`ProductID`),
  INDEX `fk_Products_Categories_idx` (`CategoryID` ASC),
  CONSTRAINT `fk_Products_Categories`
    FOREIGN KEY (`CategoryID`)
    REFERENCES `MOMANDPOP`.`Categories` (`CategoryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
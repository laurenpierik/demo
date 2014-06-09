SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `Model` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `Model` ;


-- -----------------------------------------------------
-- Table `Model`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Model`.`Customers` (
  `CustomerID` INT  NOT NULL AUTO_INCREMENT,
  `CustomerName` VARCHAR(255) NULL,
  `CustomerContact` VARCHAR(255) NULL,
  `Address` VARCHAR(500) NULL,
  `City` VARCHAR(255) NULL,
  `PostalCode` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Model`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Model`.`Employees` (
  `EmployeeID` INT NOT NULL,
  `LastName` VARCHAR(255) NULL,
  `FirstName` VARCHAR(255) NULL,
  `BirthDate` DATE NULL,
  `Photo` LONGBLOB NULL,
  `Notes` LONGTEXT NULL,
  PRIMARY KEY (`EmployeeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Model`.`Suppliers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Model`.`Suppliers` (
  `SupplierID` INT NOT NULL,
  `SupplierName` VARCHAR(255) NULL,
  `ContactName` VARCHAR(255) NULL,
  `Address` VARCHAR(500) NULL,
  `City` VARCHAR(45) NULL,
  `PostalCode` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  `Phone` VARCHAR(45) NULL,
  PRIMARY KEY (`SupplierID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Model`.`Shippers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Model`.`Shippers` (
  `ShipperID` INT NOT NULL,
  `ShipperName` VARCHAR(255) NULL,
  `Phone` VARCHAR(45) NULL,
  PRIMARY KEY (`ShipperID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Model`.`Categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Model`.`Categories` (
  `CategoryID` INT NOT NULL,
  `Categoryname` VARCHAR(45) NULL,
  `Description` VARCHAR(255) NULL,
  PRIMARY KEY (`CategoryID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Model`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Model`.`Products` (
  `ProductID` INT NOT NULL,
  `ProductName` VARCHAR(45) NULL,
  `SupplierID` INT NULL,
  `CategoryID` INT NULL,
  `Unit` VARCHAR(255) NULL,
  `Price` DECIMAL(12,2) NULL,
  PRIMARY KEY (`ProductID`),
  INDEX `fk_Products_Categories_idx` (`CategoryID` ASC),
  INDEX `fk_Products_Suppliers1_idx` (`SupplierID` ASC),
  CONSTRAINT `fk_Products_Categories`
    FOREIGN KEY (`CategoryID`)
    REFERENCES `Model`.`Categories` (`CategoryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Products_Suppliers1`
    FOREIGN KEY (`SupplierID`)
    REFERENCES `Model`.`Suppliers` (`SupplierID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Model`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Model`.`Orders` (
  `OrderID` INT NOT NULL,
  `CustomerID` INT NULL,
  `EmployeeID` INT NULL,
  `OrderDate` DATETIME NULL,
  `ShipperID` INT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `fk_Orders_Customers1_idx` (`CustomerID` ASC),
  INDEX `fk_Orders_Employees1_idx` (`EmployeeID` ASC),
  INDEX `fk_Orders_Shippers1_idx` (`ShipperID` ASC),
  CONSTRAINT `fk_Orders_Customers1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `Model`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Employees1`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `Model`.`Employees` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Shippers1`
    FOREIGN KEY (`ShipperID`)
    REFERENCES `Model`.`Shippers` (`ShipperID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Model`.`OrderDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Model`.`OrderDetails` (
  `OrderDetailID` INT NOT NULL,
  `OrderID` INT NULL,
  `ProductID` INT NULL,
  `Quantity` INT NULL,
  PRIMARY KEY (`OrderDetailID`),
  INDEX `fk_OrderDetails_Orders1_idx` (`OrderID` ASC),
  INDEX `fk_OrderDetails_Products1_idx` (`ProductID` ASC),
  CONSTRAINT `fk_OrderDetails_Orders1`
    FOREIGN KEY (`OrderID`)
    REFERENCES `Model`.`Orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderDetails_Products1`
    FOREIGN KEY (`ProductID`)
    REFERENCES `Model`.`Products` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;





use Model;

LOAD DATA LOCAL INFILE 'Customers.csv' INTO TABLE Customers
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;


LOAD DATA LOCAL INFILE 'Categories.csv' INTO TABLE Categories
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'Employees.csv' INTO TABLE Employees
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'Shippers.csv' INTO TABLE Shippers
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;





LOAD DATA LOCAL INFILE 'Suppliers.csv' INTO TABLE Suppliers
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;


LOAD DATA LOCAL INFILE 'Products.csv' INTO TABLE Products
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;


LOAD DATA LOCAL INFILE 'Orders.csv' INTO TABLE Orders
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;




LOAD DATA LOCAL INFILE 'OrderDetails.csv' INTO TABLE OrderDetails
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

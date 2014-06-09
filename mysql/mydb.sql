SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`PROFILE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PROFILE` ;

CREATE TABLE IF NOT EXISTS `mydb`.`PROFILE` (
  `USERNAME` VARCHAR(255) NOT NULL,
  `FIRST_NAME` VARCHAR(255) NOT NULL,
  `LAST_NAME` VARCHAR(255) NULL,
  `CURR_TITLE` VARCHAR(255) NULL,
  `RECENT_JOBS` VARCHAR(255) NULL,
  `SUMMARY` LONGTEXT NULL,
  PRIMARY KEY (`USERNAME`));


-- -----------------------------------------------------
-- Table `mydb`.`EXPERIENCE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`EXPERIENCE` ;

CREATE TABLE IF NOT EXISTS `mydb`.`EXPERIENCE` (
  `SEQ` INT NOT NULL,
  `USERNAME` VARCHAR(255) NOT NULL,
  `COMPANY` VARCHAR(255) NULL,
  `JOB_TITLE` VARCHAR(255) NULL,
  `START_DATE` DATE NULL,
  `END_DATE` DATE NULL,
  `DESCRIPTION` LONGTEXT NULL,
  PRIMARY KEY (`SEQ`),
  INDEX `fk_EXPERIENCE_PROFILE_idx` (`USERNAME` ASC),
  CONSTRAINT `fk_EXPERIENCE_PROFILE`
    FOREIGN KEY (`USERNAME`)
    REFERENCES `mydb`.`PROFILE` (`USERNAME`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

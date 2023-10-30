-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hollywood
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hollywood
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hollywood` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- -----------------------------------------------------
-- Schema blockbuster
-- -----------------------------------------------------
USE `hollywood` ;

-- -----------------------------------------------------
-- Table `hollywood`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hollywood`.`actor` (
  `actor_id` INT NOT NULL,
  `first_name` TEXT NULL DEFAULT NULL,
  `last_name` TEXT NULL DEFAULT NULL,
  `last_update` TEXT NULL DEFAULT NULL,
  INDEX `idx_actor_id` (`actor_id` ASC) VISIBLE,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hollywood`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hollywood`.`category` (
  `category_id` INT NOT NULL,
  `name` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hollywood`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hollywood`.`customers` (
  `customer_id` INT NOT NULL,
  `First_Name` TEXT NULL DEFAULT NULL,
  `Last_Name` TEXT NULL DEFAULT NULL,
  `Phone_Number` TEXT NULL DEFAULT NULL,
  `Email` TEXT NULL DEFAULT NULL,
  `Address` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hollywood`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hollywood`.`film` (
  `film_id` INT NOT NULL,
  `title` TEXT NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `release_year` INT NULL DEFAULT NULL,
  `original_language_id` TEXT NULL DEFAULT NULL,
  `rental_duration` INT NULL DEFAULT NULL,
  `rental_rate` DOUBLE NULL DEFAULT NULL,
  `length` INT NULL DEFAULT NULL,
  `replacement_cost` DOUBLE NULL DEFAULT NULL,
  `rating` TEXT NULL DEFAULT NULL,
  `last_update` TEXT NULL DEFAULT NULL,
  `deleted scenes` TEXT NULL DEFAULT NULL,
  `commentaries` TEXT NULL DEFAULT NULL,
  `behind the scenes` TEXT NULL DEFAULT NULL,
  `trailers` TEXT NULL DEFAULT NULL,
  `category_category_id` INT NOT NULL,
  INDEX `idx_film_id` (`film_id` ASC) VISIBLE,
  PRIMARY KEY (`film_id`, `category_category_id`),
  INDEX `fk_film_category1_idx` (`category_category_id` ASC) VISIBLE,
  CONSTRAINT `fk_film_category1`
    FOREIGN KEY (`category_category_id`)
    REFERENCES `hollywood`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hollywood`.`film_actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hollywood`.`film_actor` (
  `film_id` INT NOT NULL,
  `actor_id` INT NOT NULL,
  PRIMARY KEY (`film_id`, `actor_id`),
  INDEX `actor_id` (`actor_id` ASC) VISIBLE,
  CONSTRAINT `film_actor_ibfk_1`
    FOREIGN KEY (`film_id`)
    REFERENCES `hollywood`.`film` (`film_id`),
  CONSTRAINT `film_actor_ibfk_2`
    FOREIGN KEY (`actor_id`)
    REFERENCES `hollywood`.`actor` (`actor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hollywood`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hollywood`.`inventory` (
  `inventory_id` INT NOT NULL,
  `store_id` INT NULL DEFAULT NULL,
  `last_update` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`inventory_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hollywood`.`language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hollywood`.`language` (
  `language_id` INT NOT NULL,
  `name` TEXT NULL DEFAULT NULL,
  `last_update` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`language_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hollywood`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hollywood`.`rental` (
  `rental_id` INT NOT NULL,
  `rental_date` TEXT NULL DEFAULT NULL,
  `return_date` TEXT NULL DEFAULT NULL,
  `staff_id` INT NULL DEFAULT NULL,
  `last_update` TEXT NULL DEFAULT NULL,
  `days` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`rental_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;









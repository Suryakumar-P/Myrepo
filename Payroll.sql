-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Payroll_system
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Payroll_system
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Payroll_system` ;
USE `Payroll_system` ;

-- -----------------------------------------------------
-- Table `Payroll_system`.`login_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Payroll_system`.`login_details` (
  `id` VARCHAR(4) NOT NULL,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `account_type` VARCHAR(10) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Payroll_system`.`employee_pay`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Payroll_system`.`employee_pay` (
  `employee_grade` VARCHAR(4) NOT NULL,
  `basic_pay` FLOAT NULL,
  `pf_percentage` FLOAT NULL,
  `tax_percentage` FLOAT NULL,
  `per_hour_overtime_pay` FLOAT NULL,
  `total_allowances` FLOAT NULL,
  `per_hour_pay` FLOAT NULL,
  PRIMARY KEY (`employee_grade`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Payroll_system`.`user_personal_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Payroll_system`.`user_personal_details` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NULL,
  `lastname` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `email_address` VARCHAR(45) NULL,
  `dob` VARCHAR(20) NULL,
  `login_id` VARCHAR(4) NULL,
  `position` VARCHAR(45) NULL,
  `doj` VARCHAR(20) NULL,
  `employee_grade` VARCHAR(4) NULL,
  `team` VARCHAR(45) NULL,
  `company_name` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`),
  INDEX `fk_user_personal_details_login_details_idx` (`login_id` ASC) VISIBLE,
  INDEX `fk_user_personal_details_employee_pay1_idx` (`employee_grade` ASC) VISIBLE,
  CONSTRAINT `fk_user_personal_details_login_details`
    FOREIGN KEY (`login_id`)
    REFERENCES `Payroll_system`.`login_details` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_personal_details_employee_pay1`
    FOREIGN KEY (`employee_grade`)
    REFERENCES `Payroll_system`.`employee_pay` (`employee_grade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Payroll_system`.`payslip`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Payroll_system`.`payslip` (
  `payslip_id` INT NOT NULL AUTO_INCREMENT,
  `total_pay` FLOAT NULL,
  `basic_pay` FLOAT NULL,
  `pf_deducted` FLOAT NULL,
  `tax_deducted` FLOAT NULL,
  `overtime_pay` FLOAT NULL,
  `allowances` FLOAT NULL,
  `hour_pay` FLOAT NULL,
  `login_id` VARCHAR(4) NULL,
  `month_of_pay` VARCHAR(20) NULL,
  PRIMARY KEY (`payslip_id`),
  INDEX `fk_table1_login_details1_idx` (`login_id` ASC) VISIBLE,
  CONSTRAINT `fk_table1_login_details1`
    FOREIGN KEY (`login_id`)
    REFERENCES `Payroll_system`.`login_details` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Payroll_system`.`pay_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Payroll_system`.`pay_details` (
  `pay_details_id` INT NOT NULL AUTO_INCREMENT,
  `hours_worked` FLOAT NULL,
  `overtime_hours` FLOAT NULL,
  `month_of_application` VARCHAR(20) NULL,
  `allowance_applied` FLOAT NULL,
  `user_id` INT NULL,
  PRIMARY KEY (`pay_details_id`),
  INDEX `fk_pay_details_user_personal_details1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_pay_details_user_personal_details1`
    FOREIGN KEY (`user_id`)
    REFERENCES `Payroll_system`.`user_personal_details` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Payroll_system`.`login_details`
-- -----------------------------------------------------
START TRANSACTION;
USE `Payroll_system`;
INSERT INTO `Payroll_system`.`login_details` (`id`, `username`, `password`, `account_type`) VALUES ('E001', 'Surya', '199921', 'Admin');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Payroll_system`.`employee_pay`
-- -----------------------------------------------------
START TRANSACTION;
USE `Payroll_system`;
INSERT INTO `Payroll_system`.`employee_pay` (`employee_grade`, `basic_pay`, `pf_percentage`, `tax_percentage`, `per_hour_overtime_pay`, `total_allowances`, `per_hour_pay`) VALUES ('M1', 15000, 5, 0, 100, 5000, 200);
INSERT INTO `Payroll_system`.`employee_pay` (`employee_grade`, `basic_pay`, `pf_percentage`, `tax_percentage`, `per_hour_overtime_pay`, `total_allowances`, `per_hour_pay`) VALUES ('M2', 25000, 6, 12, 150, 7000, 300);
INSERT INTO `Payroll_system`.`employee_pay` (`employee_grade`, `basic_pay`, `pf_percentage`, `tax_percentage`, `per_hour_overtime_pay`, `total_allowances`, `per_hour_pay`) VALUES ('M3', 32000, 7, 15, 200, 10000, 400);
INSERT INTO `Payroll_system`.`employee_pay` (`employee_grade`, `basic_pay`, `pf_percentage`, `tax_percentage`, `per_hour_overtime_pay`, `total_allowances`, `per_hour_pay`) VALUES ('M4', 56000, 8, 15, 250, 13000, 500);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Payroll_system`.`user_personal_details`
-- -----------------------------------------------------
START TRANSACTION;
USE `Payroll_system`;
INSERT INTO `Payroll_system`.`user_personal_details` (`user_id`, `firstname`, `lastname`, `phone`, `email_address`, `dob`, `login_id`, `position`, `doj`, `employee_grade`, `team`, `company_name`) VALUES (DEFAULT, 'Suryakumar', 'Patturaja', '9786335797', 'suryakumarpatturaja@gmail.com', '1999-02-01', 'E001', NULL, NULL, NULL, NULL, NULL);

COMMIT;


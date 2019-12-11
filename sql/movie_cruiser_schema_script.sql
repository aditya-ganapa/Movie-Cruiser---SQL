SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `movie_cruiser` DEFAULT CHARACTER SET latin1 ;
USE `movie_cruiser` ;

-- -----------------------------------------------------
-- Table `movie_cruiser`.`user`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `movie_cruiser`.`user` (
  `us_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `us_name` VARCHAR(60) NULL DEFAULT NULL ,
  PRIMARY KEY (`us_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `movie_cruiser`.`movie`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `movie_cruiser`.`movie` (
  `mv_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `mv_title` VARCHAR(100) NULL DEFAULT NULL ,
  `mv_box_office` BIGINT(200) NULL DEFAULT NULL ,
  `mv_active` VARCHAR(3) NULL DEFAULT NULL ,
  `mv_date_of_launch` DATE NULL DEFAULT NULL ,
  `mv_genre` VARCHAR(45) NULL DEFAULT NULL ,
  `mv_has_teaser` VARCHAR(3) NULL DEFAULT NULL ,
  PRIMARY KEY (`mv_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `movie_cruiser`.`favorites`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `movie_cruiser`.`favorites` (
  `fv_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `fv_us_id` INT(11) NULL DEFAULT NULL ,
  `fv_mv_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`fv_id`) ,
  INDEX `fv_us_fk_idx` (`fv_us_id` ASC) ,
  INDEX `fv_mv_fk_idx` (`fv_mv_id` ASC) ,
  CONSTRAINT `fv_us_fk`
    FOREIGN KEY (`fv_us_id` )
    REFERENCES `movie_cruiser`.`user` (`us_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fv_mv_fk`
    FOREIGN KEY (`fv_mv_id` )
    REFERENCES `movie_cruiser`.`movie` (`mv_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

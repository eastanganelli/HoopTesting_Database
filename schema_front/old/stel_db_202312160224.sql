﻿--
-- Script was generated by Devart dbForge Studio 2022 for MySQL, Version 9.1.21.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 16/12/2023 02:24:58
-- Server version: 5.7.44
-- Client version: 4.1
--

-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set SQL mode
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

--
-- Set default database
--
USE STEL_DB_STATIC;

--
-- Drop table `cond_period`
--
DROP TABLE IF EXISTS cond_period;

--
-- Drop table `period_by_specification`
--
DROP TABLE IF EXISTS period_by_specification;

--
-- Drop table `standard`
--
DROP TABLE IF EXISTS standard;

--
-- Drop table `specification`
--
DROP TABLE IF EXISTS specification;

--
-- Drop table `material`
--
DROP TABLE IF EXISTS material;

--
-- Set default database
--
USE STEL_DB_STATIC;

--
-- Create table `material`
--
CREATE TABLE material (
  id int(11) UNSIGNED NOT NULL,
  name varchar(50) NOT NULL,
  type varchar(40) NOT NULL,
  createdAt datetime NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci,
COMMENT = 'Material of Hoop';

--
-- Create table `specification`
--
CREATE TABLE specification (
  id int(11) UNSIGNED NOT NULL,
  material int(11) UNSIGNED NOT NULL,
  name varchar(50) NOT NULL,
  createdAt datetime NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci,
COMMENT = 'Specification of material';

--
-- Create foreign key
--
ALTER TABLE specification
ADD CONSTRAINT FK_specification_material_id FOREIGN KEY (material)
REFERENCES material (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Create table `standard`
--
CREATE TABLE standard (
  id int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  createdAt datetime NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci,
COMMENT = 'Standards: ISO, IRAM, ...';

--
-- Create table `period_by_specification`
--
CREATE TABLE period_by_specification (
  id int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  specification int(11) UNSIGNED NOT NULL,
  standard int(11) UNSIGNED NOT NULL,
  hours smallint(6) UNSIGNED NOT NULL,
  minutes smallint(6) UNSIGNED NOT NULL,
  temperature tinyint(4) UNSIGNED NOT NULL,
  createdAt datetime NOT NULL,
  updatedAt datetime NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 2,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci,
COMMENT = 'Conditional period by Specification';

--
-- Create index `FK_period_by_material_material_id` on table `period_by_specification`
--
ALTER TABLE period_by_specification
ADD INDEX FK_period_by_material_material_id (specification);

--
-- Create foreign key
--
ALTER TABLE period_by_specification
ADD CONSTRAINT FK_period_by_material_specification_id FOREIGN KEY (specification)
REFERENCES specification (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Create foreign key
--
ALTER TABLE period_by_specification
ADD CONSTRAINT FK_period_by_material_standard_id FOREIGN KEY (standard)
REFERENCES standard (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Create table `cond_period`
--
CREATE TABLE cond_period (
  id int(11) UNSIGNED NOT NULL,
  standard int(11) UNSIGNED NOT NULL,
  minwall int(11) UNSIGNED NOT NULL,
  maxwall int(11) UNSIGNED NOT NULL,
  hourscond int(3) UNSIGNED NOT NULL,
  errcond int(11) UNSIGNED NOT NULL,
  createdAt datetime NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci,
COMMENT = 'Conditional Period related to Standard';

--
-- Create index `UK_cond_period` on table `cond_period`
--
ALTER TABLE cond_period
ADD UNIQUE INDEX UK_cond_period (standard, id);

--
-- Create foreign key
--
ALTER TABLE cond_period
ADD CONSTRAINT FK_cond_period_standard_id FOREIGN KEY (standard)
REFERENCES standard (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Dumping data for table material
--
INSERT INTO material VALUES
(0, 'PE', 'Plastico', '2023-12-15 12:45:36');

-- 
-- Dumping data for table specification
--
INSERT INTO specification VALUES
(0, 0, 'PE100', '2023-12-15 12:46:03');

-- 
-- Dumping data for table standard
--
INSERT INTO standard VALUES
(0, 'ISO-1167-1996', '2023-12-04 21:48:00');

-- 
-- Dumping data for table period_by_specification
--
INSERT INTO period_by_specification VALUES
(0, 0, 0, 100, 0, 90, '2023-12-15 13:11:10', '2023-12-15 13:11:10'),
(1, 0, 0, 1000, 0, 20, '2023-12-15 13:11:10', '2023-12-15 13:11:10');

-- 
-- Dumping data for table cond_period
--
INSERT INTO cond_period VALUES
(0, 0, 0, 3, 60, 5, '2023-12-04 21:48:36'),
(1, 0, 3, 8, 180, 15, '2023-12-04 21:49:27'),
(2, 0, 8, 16, 360, 30, '2023-12-04 21:56:39'),
(3, 0, 16, 32, 600, 60, '2023-12-04 21:56:39'),
(4, 0, 32, 9999999, 960, 60, '2023-12-04 21:56:39');

-- 
-- Restore previous SQL mode
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
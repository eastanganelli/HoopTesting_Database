﻿--
-- Script was generated by Devart dbForge Studio 2022 for MySQL, Version 9.1.21.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 31/12/2023 16:09:07
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

DROP DATABASE IF EXISTS STEL_DB_STATIC;

CREATE DATABASE IF NOT EXISTS STEL_DB_STATIC
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Set default database
--
USE STEL_DB_STATIC;

--
-- Create table `standard`
--
CREATE TABLE IF NOT EXISTS standard (
  id int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  createdAt datetime NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 2,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci,
COMMENT = 'Standards: ISO, IRAM, ...';

DELIMITER $$

--
-- Create procedure `get_Standards`
--
CREATE
DEFINER = 'root'@'%'
PROCEDURE get_Standards ()
BEGIN

  SELECT
    s.id AS idStandard,
    s.name AS standardName
  FROM standard s;

END
$$

DELIMITER ;

--
-- Create table `conditional_period`
--
CREATE TABLE IF NOT EXISTS conditional_period (
  id int(11) UNSIGNED NOT NULL,
  standard int(11) UNSIGNED NOT NULL,
  minwall int(11) UNSIGNED NOT NULL,
  maxwall int(11) UNSIGNED NOT NULL,
  time varchar(12) NOT NULL,
  createdAt datetime NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci,
COMMENT = 'Conditional Period related to Standard';

--
-- Create index `UK_cond_period` on table `conditional_period`
--
ALTER TABLE conditional_period
ADD UNIQUE INDEX UK_cond_period (standard, id);

--
-- Create foreign key
--
ALTER TABLE conditional_period
ADD CONSTRAINT FK_cond_period_standard_id FOREIGN KEY (standard)
REFERENCES standard (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

DELIMITER $$

--
-- Create procedure `get_ConditionalPeriodsbyStandard`
--
CREATE
DEFINER = 'root'@'%'
PROCEDURE get_ConditionalPeriodsbyStandard (IN idStandard int UNSIGNED)
BEGIN

  SELECT
    cp.id AS idCondPeriod,
    cp.minwall AS minWall,
    cp.maxwall AS maxWall,
    cp.time AS condPeriod
  FROM conditional_period cp
  WHERE cp.standard = idStandard
  ORDER BY cp.minwall;

END
$$

DELIMITER ;

--
-- Create table `material`
--
CREATE TABLE IF NOT EXISTS material (
  id int(11) UNSIGNED NOT NULL,
  name varchar(50) NOT NULL,
  type varchar(40) NOT NULL,
  createdAt datetime NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci,
COMMENT = 'Material of Hoop';

DELIMITER $$

--
-- Create procedure `get_Material`
--
CREATE
DEFINER = 'root'@'%'
PROCEDURE get_Material ()
BEGIN

  SELECT
    m.id AS idMaterial,
    m.name AS materialName,
    m.type AS materialType
  FROM material m;

END
$$

DELIMITER ;

--
-- Create table `specification`
--
CREATE TABLE IF NOT EXISTS specification (
  id int(11) UNSIGNED NOT NULL,
  material int(11) UNSIGNED NOT NULL,
  name varchar(50) NOT NULL,
  createdAt datetime NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 16384,
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
-- Create table `period_by_specification`
--
CREATE TABLE IF NOT EXISTS period_by_specification (
  id int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  specification int(11) UNSIGNED NOT NULL,
  standard int(11) UNSIGNED NOT NULL,
  time time NOT NULL,
  hours smallint(6) UNSIGNED NOT NULL,
  seconds smallint(6) UNSIGNED NOT NULL,
  temperature tinyint(4) UNSIGNED NOT NULL,
  createdAt datetime NOT NULL,
  updatedAt datetime NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 5,
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

DELIMITER $$

--
-- Create procedure `get_StandardTree`
--
CREATE
DEFINER = 'root'@'%'
PROCEDURE get_StandardTree ()
BEGIN

  CREATE TEMPORARY TABLE IF NOT EXISTS standardPeriods AS (SELECT
      cp.standard AS idStandard,
      JSON_ARRAYAGG(JSON_OBJECT(
      'id', cp.id,
      'min_wall', cp.minwall,
      'max_wall', cp.maxwall,
      'period', cp.time
      )) AS condPeriods
    FROM conditional_period cp
    GROUP BY cp.standard);

  CREATE TEMPORARY TABLE IF NOT EXISTS specificationClassification AS (SELECT
      pbs.standard AS idStandard,
      pbs.specification AS idSpecification,
      m.id AS idMaterial,
      JSON_OBJECT(
      'idSpecification', pbs.specification,
      'specification', s1.name,
      'mySettings', JSON_ARRAYAGG(JSON_OBJECT(
      'id', pbs.id,
      'data', JSON_OBJECT(
      'h', pbs.hours,
      'm', pbs.seconds,
      'temp', pbs.temperature
      )
      ))
      ) AS mySpecs
    FROM period_by_specification pbs
      INNER JOIN specification s1
        ON pbs.specification = s1.id
      INNER JOIN material m
        ON s1.material = m.id
    GROUP BY idStandard,
             idSpecification,
             idMaterial);

  CREATE TEMPORARY TABLE IF NOT EXISTS materialClassification (SELECT
      sc.idStandard AS idStandard,
      sc.idMaterial AS idMaterial,
      JSON_OBJECT(
      'idMaterial', sc.idMaterial,
      'material', m.name,
      'type', m.type,
      'mySpecs', JSON_ARRAYAGG(sc.mySpecs)
      ) AS myMaterials
    FROM specificationClassification sc
      INNER JOIN material m
        ON m.id = sc.idMaterial
    GROUP BY idStandard,
             idMaterial);

  SELECT
    mc.idStandard AS idStandard,
    JSON_OBJECT(
    'id', s.id,
    'standard', s.name,
    'conditionalPeriods', (SELECT
        sp.condPeriods
      FROM standardPeriods sp
      WHERE sp.idStandard = mc.idStandard),
    'myMaterials', JSON_ARRAYAGG(mc.myMaterials)
    ) AS myStandards
  FROM materialClassification mc
    INNER JOIN standard s
      ON s.id = mc.idStandard
  GROUP BY idStandard;

  DROP TABLE IF EXISTS standardPeriods;
  DROP TABLE IF EXISTS specificationClassification;
  DROP TABLE IF EXISTS materialClassification;

END
$$

--
-- Create procedure `get_SpecificationByStandard`
--
CREATE
DEFINER = 'root'@'%'
PROCEDURE get_SpecificationByStandard (IN idStandard int UNSIGNED, IN idMaterial int UNSIGNED)
BEGIN

  SELECT
    m.id AS idMaterial,
    s.id AS idSpecification,
    s.name AS specificationName
  FROM period_by_specification pbs
    INNER JOIN specification s
      ON pbs.specification = s.id
    INNER JOIN material m
      ON s.material = m.id
  WHERE pbs.standard = idStandard
  AND m.id = idMaterial
  GROUP BY pbs.standard,
           idMaterial,
           idSpecification;

END
$$

--
-- Create procedure `get_MaterialsByStandard`
--
CREATE
DEFINER = 'root'@'%'
PROCEDURE get_MaterialsByStandard (IN idStandard int UNSIGNED)
BEGIN

  SELECT
    m.id AS idMaterial,
    m.name AS materialName,
    m.type AS materialType
  FROM period_by_specification pbs
    INNER JOIN specification s
      ON pbs.specification = s.id
    INNER JOIN material m
      ON s.material = m.id
  WHERE pbs.standard = idStandard
  GROUP BY idStandard,
           idMaterial;

END
$$

--
-- Create procedure `get_DataSpecsByStandard`
--
CREATE
DEFINER = 'root'@'%'
PROCEDURE get_DataSpecsByStandard (IN idStandard int UNSIGNED, IN idMaterial int UNSIGNED, IN idSpecification int UNSIGNED)
BEGIN

  SELECT
    pbs.standard AS idStandard,
    pbs.temperature AS temperature,
    pbs.hours AS hours,
    pbs.seconds AS seconds
  FROM period_by_specification pbs
    INNER JOIN specification s
      ON pbs.specification = s.id
    INNER JOIN material m
      ON s.material = m.id
  WHERE pbs.standard = idStandard
  AND m.id = idMaterial
  AND s.id = idSpecification;

END
$$

DELIMITER ;

-- 
-- Dumping data for table material
--
INSERT INTO material VALUES
(0, 'PE', 'Plastico', '2023-12-15 12:45:36'),
(1, 'PBC', 'Plastico', '2023-12-20 12:57:44');

-- 
-- Dumping data for table specification
--
INSERT INTO specification VALUES
(0, 0, 'PE100', '2023-12-15 12:46:03'),
(1, 0, 'PE50', '2023-12-18 20:06:57'),
(2, 1, 'PBC-200', '2023-12-20 13:03:02');

-- 
-- Dumping data for table standard
--
INSERT INTO standard VALUES
(0, 'ISO-1167-1996', '2023-12-04 21:48:00'),
(1, 'IRAM-4567', '2023-12-18 21:16:48');

-- 
-- Dumping data for table period_by_specification
--
INSERT INTO period_by_specification VALUES
(0, 0, 0, '00:00:00', 100, 0, 90, '2023-12-15 13:11:10', '2023-12-15 13:11:10'),
(1, 0, 0, '00:00:00', 1000, 0, 20, '2023-12-15 13:11:10', '2023-12-15 13:11:10'),
(2, 1, 1, '00:00:00', 50, 0, 150, '2023-12-19 01:33:14', '2023-12-19 01:33:16'),
(3, 1, 0, '23:00:00', 0, 0, 50, '2023-12-19 02:01:18', '2023-12-19 02:01:20'),
(4, 2, 0, '23 00:00:00', 23, 23, 50, '2023-12-20 13:17:38', '2023-12-20 13:17:39');

-- 
-- Dumping data for table conditional_period
--
INSERT INTO conditional_period VALUES
(0, 0, 0, 3, '1 h ± 5 min', '2023-12-04 21:48:36'),
(1, 0, 3, 8, '3 h ± 15 min', '2023-12-04 21:49:27'),
(2, 0, 8, 16, '6 h ± 30 min', '2023-12-04 21:56:39'),
(3, 0, 16, 32, '10 h ± 1 h', '2023-12-04 21:56:39'),
(4, 0, 32, 9999999, '16 h ± 1 h', '2023-12-04 21:56:39');

-- 
-- Restore previous SQL mode
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
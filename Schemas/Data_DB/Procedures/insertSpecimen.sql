DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE PROCEDURE `insertSpecimen`(IN idSample int UNSIGNED, IN targetPressureIn int, IN targetTempIn int, IN operatorName varchar(40), IN enviromentIn varchar(20), IN testNameIn varchar(120), IN endCapIn varchar(10))
BEGIN

  INSERT INTO specimen (sample, targetPressure, targetTemperature, operator, enviroment, testName, endCap, createdAt, updatedAt)
    VALUES (idSample, targetPressureIn, targetTempIn, operatorName, enviromentIn, testNameIn, endCapIn, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());

  SELECT
    ts.id AS `idSpecimen`
  FROM specimen ts
  ORDER BY ts.id DESC
  LIMIT 1;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE insertSpecimen TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE insertSpecimen TO 'databaseManager'@'%';
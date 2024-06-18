DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE PROCEDURE `selectEnviroment`(IN idStandard int UNSIGNED)
  DETERMINISTIC
BEGIN

  SELECT
    ehs.id,
    ehs.inside,
    ehs.outside
  FROM enviroment ehs
  WHERE ehs.standard = idStandard;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE selectEnviroment TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE selectEnviroment TO 'databaseManager'@'%';
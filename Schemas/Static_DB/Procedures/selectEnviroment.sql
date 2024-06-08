DELIMITER $$

CREATE PROCEDURE `selectEnviroment`(IN idStandard INT UNSIGNED)
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
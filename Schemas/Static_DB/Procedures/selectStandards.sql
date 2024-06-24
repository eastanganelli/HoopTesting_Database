DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE PROCEDURE `selectStandards`()
  DETERMINISTIC
BEGIN

  SELECT
    s.id AS idStandard,
    s.name AS standardName
  FROM standard s;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE selectStandards TO 'dataCollector'@'%';
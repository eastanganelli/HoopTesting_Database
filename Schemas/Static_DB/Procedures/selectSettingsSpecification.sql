DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE PROCEDURE `selectSettingsSpecification`(IN idSpecification int UNSIGNED)
  DETERMINISTIC
BEGIN

  SELECT
    sc.id AS idSetting,
    sc.time AS time,
    sc.temperature AS temperature
  FROM specification_configuration sc
  WHERE sc.specification = idSpecification;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE selectSettingsSpecification TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE selectSettingsSpecification TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE selectSettingsSpecification TO 'manager'@'%';
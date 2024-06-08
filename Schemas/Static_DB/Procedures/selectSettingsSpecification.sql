DELIMITER $$

CREATE PROCEDURE `selectSettingsSpecification`(IN idSpecification INT UNSIGNED)
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
DELIMITER $$

CREATE PROCEDURE `selectSettingsSpecification`(IN idSpecification int UNSIGNED)
  DETERMINISTIC
BEGIN

  SELECT
    sc.id AS idSetting,
    sc.time AS time,
    sc.timeType AS timeType,
    sc.temperature AS temperature
  FROM settings_specification sc
  WHERE sc.specification = idSpecification;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE selectSettingsSpecification TO 'dataCollector'@'%';
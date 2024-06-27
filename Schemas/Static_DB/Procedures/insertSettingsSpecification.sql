DELIMITER $$

CREATE PROCEDURE `insertSettingsSpecification`(IN specificationIN INT UNSIGNED, IN timeIN SMALLINT, IN timeTypeIN VARCHAR(1), IN temperatureIN TINYINT)
  DETERMINISTIC
BEGIN

  DECLARE selected bigint;

  SELECT
    COUNT(*) INTO selected
  FROM settings_specification sc
  WHERE sc.specification = specificationIN
  AND sc.time = timeIN
  AND sc.temperature = temperatureIN;

  IF (selected = 0) THEN
    INSERT INTO settings_specification (specification, time, timeType, temperature)
      VALUES (specificationIN, timeIN, timeTypeIN, temperatureIN);

    SELECT
      sc.id AS `key`,
      sc.time AS `time`,
      sc.timeType AS `timeType`,
      sc.temperature AS `temperature`
    FROM settings_specification sc
    WHERE sc.specification = specificationIN
    AND sc.time = timeIN
    AND sc.temperature = temperatureIN;

  ELSE
    SELECT
      'Already Exists!' AS `response`;
  END IF;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE insertSettingsSpecification TO 'databaseManager'@'%';
DELIMITER $$

CREATE PROCEDURE `updateSettingsSpecification`(IN id INT UNSIGNED, IN timeIN SMALLINT, IN timeTypeIN VARCHAR(1), IN temperatureIN TINYINT)
  DETERMINISTIC
BEGIN

  DECLARE result text;

  IF (existSettingsSpecification(id) = TRUE) THEN
    UPDATE LOW_PRIORITY settings_specification sc
    SET sc.id = id,
        sc.time = timeIN,
        sc.timeType = timeTypeIN,
        sc.temperature = temperatureIN
    WHERE sc.id = id;

    SELECT
      'Successful Updated!' INTO result;
  ELSE
    SELECT
      'Unsuccessful Updated!' INTO result;
  END IF;

  SELECT
    result AS response;
END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE updateSettingsSpecification TO 'databaseManager'@'%';
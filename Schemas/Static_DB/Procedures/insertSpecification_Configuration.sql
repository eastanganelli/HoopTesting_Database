DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE PROCEDURE `insertSpecification_Configuration`(IN specificationIN int UNSIGNED, IN timeIN smallint, IN timeTypeIN varchar(1), IN temperatureIN tinyint)
  DETERMINISTIC
BEGIN

  DECLARE selected bigint;

  SELECT
    COUNT(*) INTO selected
  FROM specification_configuration sc
  WHERE sc.specification = specificationIN
  AND sc.time = timeIN
  AND sc.temperature = temperatureIN;

  IF (selected = 0) THEN
    INSERT INTO specification_configuration (specification, time, timeType, temperature)
      VALUES (specificationIN, timeIN, timeTypeIN, temperatureIN);

    SELECT
      sc.id AS `key`,
      sc.time AS `time`,
      sc.timeType AS `timeType`,
      sc.temperature AS `temperature`
    FROM specification_configuration sc
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

GRANT EXECUTE ON PROCEDURE insertSpecification_Configuration TO 'databaseManager'@'%';
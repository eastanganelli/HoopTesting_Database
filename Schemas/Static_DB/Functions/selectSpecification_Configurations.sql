DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE FUNCTION `selectSpecification_Configurations`(idSpecification int UNSIGNED)
  RETURNS JSON
  DETERMINISTIC
BEGIN

  DECLARE result json;
  DECLARE elements tinyint;

  SELECT
    COUNT(*) INTO elements
  FROM specification_configuration sc
  WHERE sc.specification = idSpecification;

  IF (elements > 0) THEN
    SELECT
      JSON_ARRAYAGG(JSON_OBJECT('key', sc.id,
      'time', sc.time,
      'type', sc.timeType,
      'temperature', sc.temperature)) INTO result
    FROM specification_configuration sc
    WHERE sc.specification = idSpecification;
  ELSE
    SELECT
      '[]' INTO result;
  END IF;

  RETURN result;
END
$$

DELIMITER ;
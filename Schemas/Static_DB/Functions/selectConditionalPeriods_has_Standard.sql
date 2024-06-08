DELIMITER $$

CREATE FUNCTION `selectConditionalPeriods_has_Standard`(idStandard int UNSIGNED)
  RETURNS JSON
  DETERMINISTIC
BEGIN

  DECLARE result json;
  DECLARE elements tinyint(1);

  SELECT
    COUNT(*) INTO elements
  FROM conditional_period cp
  WHERE cp.standard = idStandard;

  IF (elements > 0) THEN
    SELECT
      JSON_ARRAYAGG(JSON_OBJECT('key', cp.id,
      'time', cp.time,
      'minwall', cp.minwall,
      'maxwall', cp.maxwall)) INTO result
    FROM conditional_period cp
    WHERE cp.standard = idStandard;
  ELSE
    SELECT
      '[]' INTO result;
  END IF;

  RETURN result;
END
$$

DELIMITER ;
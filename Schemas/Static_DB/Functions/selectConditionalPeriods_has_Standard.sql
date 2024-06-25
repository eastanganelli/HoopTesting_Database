DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE FUNCTION `selectConditionalPeriods_has_Standard`(idStandard int UNSIGNED)
  RETURNS JSON
  DETERMINISTIC
  COMMENT 'Selection of Conditional Periods of a Standard'
BEGIN

  DECLARE result json;
  DECLARE elements tinyint(1);

  SELECT
    COUNT(*) INTO elements
  FROM conditional_period cp
  WHERE cp.standard = idStandard;

  IF (elements > 0) THEN
    WITH periodsOrder AS (
      SELECT
        cp.id AS `key`,
        CONCAT(CONVERT(cp.time, CHAR), ' ', cp.timeType, ' ± ', CONVERT(cp.aproxTime, CHAR), ' ', cp.aproxType) AS `condPeriod`,
        cp.minwall,
        cp.maxwall
      FROM conditional_period cp
      WHERE cp.standard = idStandard
    )

    SELECT
      JSON_ARRAYAGG(JSON_OBJECT('key', po.`key`,
      'condPeriod', po.condPeriod,
      'minwall', po.minwall,
      'maxwall', po.maxwall)) INTO result
    FROM periodsOrder po;
  ELSE
    SELECT
      '[]' INTO result;
  END IF;

  RETURN result;
END
$$

DELIMITER ;
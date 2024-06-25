DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE PROCEDURE `insertConditionalPeriod`(IN idStandard INT UNSIGNED, IN minwall INT UNSIGNED, IN maxwall INT UNSIGNED, IN time INT UNSIGNED, IN timeType VARCHAR(3), IN aproxTime INT UNSIGNED, IN aproxType VARCHAR(3))
  DETERMINISTIC
  COMMENT 'Insertion of new Conditional Period'
BEGIN

  DECLARE elements int UNSIGNED;

  SELECT
    COUNT(*) INTO elements
  FROM conditional_period cp
  WHERE cp.standard = idStandard
  AND cp.minwall = minwall
  AND cp.maxwall = maxwall
  AND cp.time = time
  AND cp.timeType LIKE timeType
  AND cp.aproxTime = aproxTime
  AND cp.aproxType LIKE aproxType;

  IF elements = 0 THEN
    INSERT HIGH_PRIORITY INTO conditional_period (standard, time, timeType, aproxTime, aproxType, minwall, maxwall)
      VALUES (idStandard, time, timeType, aproxTime, aproxType, minwall, maxwall);

    SELECT
      cp.id AS `key`,
      CONCAT(CONVERT(cp.time, CHAR), ' ', cp.timeType, ' ± ', CONVERT(cp.aproxTime, CHAR), ' ', cp.aproxType) AS `condperiod`,
      cp.minwall AS `minwall`,
      cp.maxwall AS `maxwall`
    FROM conditional_period cp
    WHERE cp.standard = idStandard
    AND cp.minwall = minwall
    AND cp.maxwall = maxwall
    AND cp.time LIKE time;

  ELSE
    SELECT
      'Already Exist!' AS `response`;
  END IF;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE insertConditionalPeriod TO 'databaseManager'@'%';
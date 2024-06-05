DELIMITER $$

CREATE PROCEDURE `insertConditionalPeriod`(IN idStandard INT UNSIGNED, IN minwall INT, IN maxwall INT, IN time VARCHAR(20))
  DETERMINISTIC
BEGIN

  DECLARE elements int UNSIGNED;

  SELECT
    COUNT(*)
  FROM conditional_period cp
  WHERE cp.standard = idStandard
  AND cp.minwall = minwall
  AND cp.maxwall = maxwall
  AND cp.time LIKE time;

  IF elements = 0 THEN
    INSERT HIGH_PRIORITY INTO conditional_period (standard, time, minwall, maxwall)
      VALUES (idStandard, time, minwall, maxwall);

    SELECT
      cp.id AS `key`,
      cp.time AS `time`,
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
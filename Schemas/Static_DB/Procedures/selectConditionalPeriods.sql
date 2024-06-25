DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE PROCEDURE `selectConditionalPeriods`(IN idStandard int UNSIGNED)
  DETERMINISTIC
  COMMENT 'Selection of Conditional Periods by Standard'
BEGIN

  SELECT
    cp.id AS idCondPeriod,
    cp.minwall AS minWall,
    cp.maxwall AS maxWall,
    (CONCAT(CONVERT(cp.time, CHAR), ' ', cp.timeType, ' ± ', CONVERT(cp.aproxTime, CHAR), ' ', cp.aproxType)) AS condPeriod
  FROM conditional_period cp
  WHERE cp.standard = idStandard
  ORDER BY cp.minwall;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE selectConditionalPeriods TO 'dataCollector'@'%';
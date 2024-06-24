DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE PROCEDURE `selectConditionalPeriods`(IN idStandard int UNSIGNED)
  DETERMINISTIC
BEGIN

  SELECT
    cp.id AS idCondPeriod,
    cp.minwall AS minWall,
    cp.maxwall AS maxWall,
    cp.time AS condPeriod
  FROM conditional_period cp
  WHERE cp.standard = idStandard
  ORDER BY cp.minwall;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE selectConditionalPeriods TO 'dataCollector'@'%';
DELIMITER $$

CREATE PROCEDURE `selectConditionalPeriods`(IN idStandard INT UNSIGNED)
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
GRANT EXECUTE ON PROCEDURE selectConditionalPeriods TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE selectConditionalPeriods TO 'manager'@'%';
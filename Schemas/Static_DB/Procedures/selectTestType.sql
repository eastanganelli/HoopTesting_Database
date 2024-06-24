DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE PROCEDURE `selectTestType`(IN idStandard int UNSIGNED)
  DETERMINISTIC
BEGIN

  SELECT
    tt.id,
    tt.testType
  FROM test_type tt
  WHERE tt.standard = idStandard;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE selectTestType TO 'dataCollector'@'%';
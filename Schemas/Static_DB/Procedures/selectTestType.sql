DELIMITER $$

CREATE PROCEDURE `selectTestType`(IN idStandard INT UNSIGNED)
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
GRANT EXECUTE ON PROCEDURE selectTestType TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE selectTestType TO 'manager'@'%';
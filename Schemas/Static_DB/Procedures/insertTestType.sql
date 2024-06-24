DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE PROCEDURE `insertTestType`(IN idStandard INT UNSIGNED, IN testTypeIN VARBINARY(255))
  DETERMINISTIC
BEGIN

  DECLARE elements int UNSIGNED;

  SELECT
    COUNT(*) INTO elements
  FROM test_type tt
  WHERE tt.standard = idStandard
  AND tt.testType = testTypeIN;

  IF elements = 0 THEN
    INSERT HIGH_PRIORITY INTO test_type (standard, testType)
      VALUES (idStandard, testTypeIN);

    SELECT
      tt.id AS `key`,
      tt.testType AS `testtype`
    FROM test_type tt
    WHERE tt.standard = idStandard
    AND tt.testType = testTypeIN;

  ELSE
    SELECT
      'Already Exist!' AS `response`;
  END IF;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE insertTestType TO 'databaseManager'@'%';
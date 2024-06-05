DELIMITER $$

CREATE PROCEDURE `insertTestType`(IN idStandard int UNSIGNED, IN tesTypeIN varbinary(255))
  DETERMINISTIC
BEGIN

  DECLARE elements int UNSIGNED;

  SELECT
    COUNT(*)
  FROM test_type tt
  WHERE tt.standard = idStandard
  AND tt.testType = tesTypeIN;

  IF elements = 0 THEN
    INSERT HIGH_PRIORITY INTO test_type (standard, testType)
      VALUES (idStandard, tesTypeIN);

    SELECT
      tt.id AS `key`,
      tt.testType AS `testtype`
    FROM test_type tt
    WHERE tt.standard = idStandard
    AND tt.testType = tesTypeIN;

  ELSE
    SELECT
      'Already Exist!' AS `response`;
  END IF;

END
$$

DELIMITER ;
DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE FUNCTION `selectTest_Type`(idStandard int UNSIGNED)
  RETURNS JSON
  DETERMINISTIC
BEGIN

  DECLARE result json;
  DECLARE elements tinyint;

  SELECT
    COUNT(*) INTO elements
  FROM test_type tt
  WHERE tt.id = idStandard;

  IF (elements > 0) THEN
      SELECT
        JSON_ARRAYAGG(JSON_OBJECT('key', tt.id,
        'testtype', tt.testType)) INTO result
      FROM test_type tt
      WHERE tt.id = idStandard;
  ELSE
    SELECT
      '[]' INTO result;
  END IF;

  RETURN result;
END
$$

DELIMITER ;
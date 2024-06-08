DELIMITER $$

CREATE FUNCTION `selectTest_Type`(idStandard INT UNSIGNED)
  RETURNS JSON
  DETERMINISTIC
BEGIN

  DECLARE result json;

  SELECT
    JSON_ARRAYAGG(JSON_OBJECT('key', tt.id,
    'testType', tt.testType)) INTO result
  FROM test_type tt
  WHERE tt.id = idStandard;

  RETURN result;
END
$$

DELIMITER ;
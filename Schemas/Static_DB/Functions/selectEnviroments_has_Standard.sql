﻿DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE FUNCTION `selectEnviroments_has_Standard`(idStandard int UNSIGNED)
  RETURNS JSON
  DETERMINISTIC
BEGIN

  DECLARE result json;
  DECLARE elements tinyint;

  SELECT
    COUNT(*) INTO elements
  FROM enviroment e
  WHERE e.standard = idStandard;

  IF (elements > 0) THEN
    SELECT
      JSON_ARRAYAGG(JSON_OBJECT('key', e.id,
      'insideFluid', e.inside,
      'outsideFluid', e.outside)) INTO result
    FROM enviroment e
    WHERE e.standard = idStandard;
  ELSE
    SELECT
      '[]' INTO result;
  END IF;

  RETURN result;
END
$$

DELIMITER ;
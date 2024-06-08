DELIMITER $$

CREATE FUNCTION `existConditionalPeriod`(id int UNSIGNED)
  RETURNS TINYINT(1)
  DETERMINISTIC
BEGIN

  DECLARE selected bigint(255);
  SELECT
    COUNT(*) INTO selected
  FROM conditional_period cp
  WHERE cp.id = id;

  IF selected != 1 THEN
    RETURN FALSE;
  ELSE
    RETURN TRUE;
  END IF;

END
$$

DELIMITER ;
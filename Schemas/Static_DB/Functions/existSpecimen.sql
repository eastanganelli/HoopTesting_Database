DELIMITER $$

CREATE FUNCTION `existSpecimen`(id INT UNSIGNED)
  RETURNS TINYINT(1)
  DETERMINISTIC
BEGIN

  DECLARE selected bigint(255);
  SELECT
    COUNT(*) INTO selected
  FROM specification s
  WHERE s.id = id;

  IF selected != 1 THEN
    RETURN FALSE;
  ELSE
    RETURN TRUE;
  END IF;

END
$$

DELIMITER ;
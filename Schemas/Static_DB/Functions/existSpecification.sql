DELIMITER $$

CREATE FUNCTION `existSpecification`(id INT UNSIGNED)
  RETURNS TINYINT(1)
  DETERMINISTIC
BEGIN

  DECLARE selected int;
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
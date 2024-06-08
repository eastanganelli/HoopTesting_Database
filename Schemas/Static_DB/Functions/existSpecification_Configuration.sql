DELIMITER $$

CREATE FUNCTION `existSpecification_Configuration`(id INT UNSIGNED)
  RETURNS TINYINT(1)
  DETERMINISTIC
BEGIN

  DECLARE selected bigint(255);
  SELECT
    COUNT(*) INTO selected
  FROM specification_configuration sc
  WHERE sc.id = id;

  IF selected != 1 THEN
    RETURN FALSE;
  ELSE
    RETURN TRUE;
  END IF;

END
$$

DELIMITER ;
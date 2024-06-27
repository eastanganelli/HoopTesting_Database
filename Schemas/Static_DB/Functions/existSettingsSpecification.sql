DELIMITER $$

CREATE FUNCTION `existSettingsSpecification`(id INT UNSIGNED)
  RETURNS TINYINT(1)
  DETERMINISTIC
BEGIN

  DECLARE selected bigint(255);

  SELECT
    COUNT(*) INTO selected
  FROM settings_specification sc
  WHERE sc.id = id;

  IF selected != 1 THEN
    RETURN FALSE;
  ELSE
    RETURN TRUE;
  END IF;

END
$$

DELIMITER ;
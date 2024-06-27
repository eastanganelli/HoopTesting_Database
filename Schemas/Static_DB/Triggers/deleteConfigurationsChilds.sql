DELIMITER $$

CREATE TRIGGER `deleteConfigurationsChilds`
	BEFORE DELETE
	ON specification
	FOR EACH ROW
BEGIN

  DECLARE childsCount int UNSIGNED;

  SELECT
    COUNT(*) INTO childsCount
  FROM settings_specification sc
  WHERE sc.specification = OLD.id;

  IF childsCount > 0 THEN
    DELETE LOW_PRIORITY QUICK
      FROM settings_specification sc
    WHERE sc.specification = OLD.id;

  END IF;

END
$$

DELIMITER ;
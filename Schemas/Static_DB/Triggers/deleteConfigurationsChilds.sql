DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE TRIGGER `deleteConfigurationsChilds`
	BEFORE DELETE
	ON specification
	FOR EACH ROW
BEGIN

  DECLARE childsCount int UNSIGNED;

  SELECT
    COUNT(*) INTO childsCount
  FROM specification_configuration sc
  WHERE sc.specification = OLD.id;

  IF childsCount > 0 THEN
    DELETE LOW_PRIORITY QUICK
      FROM specification_configuration sc
    WHERE sc.specification = OLD.id;

  END IF;

END
$$

DELIMITER ;
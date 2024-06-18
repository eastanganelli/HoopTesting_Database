DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE TRIGGER `deleteStandardChilds`
	BEFORE DELETE
	ON standard
	FOR EACH ROW
BEGIN

  DECLARE elements int UNSIGNED;

  SELECT
    COUNT(*) INTO elements
  FROM endcap e
  WHERE e.standard = OLD.id;

  IF elements > 0 THEN
    DELETE LOW_PRIORITY QUICK
      FROM endcap e
    WHERE e.standard = OLD.id;
  END IF;

  SELECT
    COUNT(*) INTO elements
  FROM conditional_period cp
  WHERE cp.standard = OLD.id;

  IF elements > 0 THEN
    DELETE LOW_PRIORITY QUICK
      FROM conditional_period cp
    WHERE cp.standard = OLD.id;
  END IF;

  SELECT
    COUNT(*) INTO elements
  FROM enviroment e
  WHERE e.standard = OLD.id;

  IF elements > 0 THEN
    DELETE LOW_PRIORITY QUICK
      FROM enviroment e
    WHERE e.standard = OLD.id;
  END IF;

  SELECT
    COUNT(*) INTO elements
  FROM test_type tt
  WHERE tt.standard = OLD.id;

  IF elements > 0 THEN
    DELETE LOW_PRIORITY QUICK
      FROM test_type tt
    WHERE tt.standard = OLD.id;
  END IF;

  SELECT
    COUNT(*) INTO elements
  FROM material_has_standard mhs
  WHERE mhs.standard = OLD.id;

  IF elements > 0 THEN
    DELETE LOW_PRIORITY QUICK
      FROM material_has_standard mhs
    WHERE mhs.standard = OLD.id;
  END IF;

END
$$

DELIMITER ;
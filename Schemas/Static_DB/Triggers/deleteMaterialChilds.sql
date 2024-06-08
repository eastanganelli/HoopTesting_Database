DELIMITER $$

CREATE TRIGGER `deleteMaterialChilds`
	BEFORE DELETE
	ON material
	FOR EACH ROW
BEGIN

  DECLARE childsCount int UNSIGNED;

  SELECT
    COUNT(*) INTO childsCount
  FROM specification s
  WHERE s.material = OLD.id;

  IF childsCount > 0 THEN
    DELETE LOW_PRIORITY QUICK
      FROM specification s
    WHERE s.material = OLD.id;

  END IF;

  SELECT
    COUNT(*) INTO childsCount
  FROM material_has_standard mhs
  WHERE mhs.material = OLD.id;

  IF childsCount > 0 THEN
    DELETE LOW_PRIORITY QUICK
      FROM material_has_standard mhs
    WHERE mhs.material = OLD.id;

  END IF;

END
$$

DELIMITER ;
DELIMITER $$

CREATE FUNCTION `selectMaterials_has_Standard`(idStandard int UNSIGNED)
  RETURNS JSON
  DETERMINISTIC
BEGIN

  DECLARE result json;
  DECLARE elements tinyint;

  SELECT
    COUNT(*) INTO elements
  FROM material_has_standard mhs
  WHERE mhs.standard = standard;

  IF (elements > 0) THEN
    SELECT
      JSON_ARRAYAGG(JSON_OBJECT('key', mhs.id,
      'idMaterial', mhs.material,
      'material', m.name,
      'descriptioin', m.description)) INTO result
    FROM material_has_standard mhs
      INNER JOIN material m
    WHERE mhs.standard = standard;
  ELSE
    SELECT
      '[]' INTO result;
  END IF;

  RETURN result;
END
$$

DELIMITER ;
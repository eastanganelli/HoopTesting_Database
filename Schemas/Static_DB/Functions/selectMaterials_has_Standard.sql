DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE FUNCTION `selectMaterials_has_Standard`(idStandard int UNSIGNED)
  RETURNS JSON
  DETERMINISTIC
BEGIN

  DECLARE result json;
  DECLARE elements tinyint;

  SELECT
    COUNT(*) INTO elements
  FROM material_has_standard mhs
  WHERE mhs.standard = idStandard;

  IF (elements > 0) THEN
    SELECT
      JSON_ARRAYAGG(JSON_OBJECT('key', mhs.id,
      'idMaterial', mhs.material,
      'material', m.name,
      'descriptioin', m.description)) INTO result
    FROM material_has_standard mhs
      INNER JOIN material m
        ON m.id = mhs.standard
    WHERE mhs.standard = idStandard;
  ELSE
    SELECT
      '[]' INTO result;
  END IF;

  RETURN result;
END
$$

DELIMITER ;
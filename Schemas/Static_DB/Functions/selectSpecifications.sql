DELIMITER $$

CREATE FUNCTION `selectSpecifications`(idMaterial int UNSIGNED)
  RETURNS JSON
  DETERMINISTIC
BEGIN

  DECLARE result json;
  DECLARE elements tinyint;

  SELECT
    COUNT(*) INTO elements
  FROM specification s
  WHERE s.material = idMaterial;

  IF (elements > 0) THEN
    SELECT
      JSON_ARRAYAGG(JSON_OBJECT('key', s.id,
      'specification', s.name,
      'description', (IF(s.description IS NULL, '', s.description)),
      'configurations', (selectSettingsSpecification(s.id)))) INTO result
    FROM specification s
    WHERE s.material = idMaterial;
  ELSE
    SELECT
      '[]' INTO result;
  END IF;

  RETURN result;
END
$$

DELIMITER ;
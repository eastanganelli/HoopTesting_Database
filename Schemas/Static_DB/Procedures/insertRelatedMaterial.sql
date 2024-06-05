DELIMITER $$

CREATE PROCEDURE `insertRelatedMaterial`(IN idStandard int UNSIGNED, IN idMaterial int UNSIGNED)
BEGIN

  DECLARE elements int UNSIGNED;

  SELECT
    COUNT(*)
  FROM material_has_standard mhs
  WHERE mhs.material = material
  AND mhs.standard = standard;

  IF elements = 0 THEN
    INSERT HIGH_PRIORITY INTO material_has_standard (idMaterial, idStandard)
      VALUES (idMaterial, idStandard);

    SELECT
      mhs.id AS `key`,
      m.id AS `idMaterial`,
      m.name AS `material`
    FROM material_has_standard mhs
      INNER JOIN material m
        ON mhs.material = m.id
    WHERE mhs.material = idMaterial
    AND mhs.standard = standard;

  ELSE
    SELECT
      'Already Exist!' AS `response`;
  END IF;

END
$$

DELIMITER ;
DELIMITER $$

CREATE PROCEDURE `insertRelatedMaterial`(IN idStandard INT UNSIGNED, IN idMaterial INT UNSIGNED)
BEGIN

  DECLARE elements int UNSIGNED;

  SELECT
    COUNT(*) into elements
  FROM material_has_standard mhs
  WHERE mhs.material = idMaterial
  AND mhs.standard = idStandard;

  IF elements = 0 THEN
    INSERT HIGH_PRIORITY INTO material_has_standard (material, standard)
      VALUES (idMaterial, idStandard);

    SELECT
      mhs.id AS `key`,
      m.id AS `idMaterial`,
      m.name AS `material`
    FROM material_has_standard mhs
      INNER JOIN material m
        ON mhs.material = m.id
    WHERE mhs.material = idMaterial
    AND mhs.standard = idStandard;

  ELSE
    SELECT
      'Already Exist!' AS `response`;
  END IF;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE insertRelatedMaterial TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE insertRelatedMaterial TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE insertRelatedMaterial TO 'manager'@'%';
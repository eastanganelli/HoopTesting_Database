DELIMITER $$

CREATE PROCEDURE `selectMaterials`(IN idStandard INT UNSIGNED)
  DETERMINISTIC
BEGIN

  SELECT
    mhs.material AS idMaterial,
    m.name AS materialName,
    m.description AS materialDescription,
    mhs.type AS materialType
  FROM material m
    INNER JOIN material_has_standard mhs
      ON m.id = mhs.material
  WHERE mhs.standard = standard;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE selectMaterials TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE selectMaterials TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE selectMaterials TO 'manager'@'%';
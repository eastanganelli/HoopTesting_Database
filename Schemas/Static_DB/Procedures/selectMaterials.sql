DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE PROCEDURE `selectMaterials`(IN idStandard int UNSIGNED)
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
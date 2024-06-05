DELIMITER $$

CREATE PROCEDURE `selectMaterialsJSON`()
  DETERMINISTIC
BEGIN

  SELECT
    JSON_ARRAYAGG(JSON_OBJECT('key', m.id,
    'material', m.name,
    'description', (IF(m.description IS NULL, 'Sin Descripción', m.description)),
    'specifications', (selectSpecifications(m.id)))) AS `materials`
  FROM material m;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE selectMaterialsJSON TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE selectMaterialsJSON TO 'manager'@'%';
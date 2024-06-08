DELIMITER $$

CREATE PROCEDURE `selectSpecifications`(IN idMaterial INT UNSIGNED)
  DETERMINISTIC
BEGIN

  SELECT
    s.id AS idSpecification,
    s.name AS nameSpecification,
    s.description AS descriptionSpecification
  FROM specification s
  WHERE s.material = idMaterial;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE selectSpecifications TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE selectSpecifications TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE selectSpecifications TO 'manager'@'%';
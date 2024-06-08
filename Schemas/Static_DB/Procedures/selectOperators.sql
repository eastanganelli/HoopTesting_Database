DELIMITER $$

CREATE PROCEDURE `selectOperators`()
  DETERMINISTIC
BEGIN

  SELECT
  o.id,
  o.dni,
  o.name,
  o.familyname
  FROM operator o;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE selectOperators TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE selectOperators TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE selectOperators TO 'manager'@'%';
DELIMITER $$

CREATE PROCEDURE `selectOperatorsJSON`()
  DETERMINISTIC
BEGIN

  SELECT
   JSON_ARRAYAGG(JSON_OBJECT(
    'key', o.id,
    'dni', o.dni,
    'name', o.name,
    'familyName', o.familyname
   )) AS `operators`
  FROM operator o;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE selectOperatorsJSON TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE selectOperatorsJSON TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE selectOperatorsJSON TO 'manager'@'%';
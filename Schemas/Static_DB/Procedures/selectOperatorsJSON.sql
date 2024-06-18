DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE PROCEDURE `selectOperatorsJSON`()
  DETERMINISTIC
BEGIN

  SELECT
    JSON_ARRAYAGG(JSON_OBJECT('key', o.id,
    'dni', o.dni,
    'name', o.name,
    'familyName', o.familyname)) AS `operators`
  FROM operator o;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE selectOperatorsJSON TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE selectOperatorsJSON TO 'manager'@'%';
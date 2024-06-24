DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
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
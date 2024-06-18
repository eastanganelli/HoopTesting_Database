DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE PROCEDURE `selectEndCaps`(IN idStandard int UNSIGNED)
BEGIN

  SELECT
    e.id AS `id`,
    e.name AS `endCap`
  FROM endcap e
  WHERE e.standard = idStandard;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE selectEndCaps TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE selectEndCaps TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE selectEndCaps TO 'manager'@'%';
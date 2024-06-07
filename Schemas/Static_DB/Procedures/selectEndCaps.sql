DELIMITER $$

CREATE PROCEDURE `selectEndCaps`(IN idStandard INT UNSIGNED)
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
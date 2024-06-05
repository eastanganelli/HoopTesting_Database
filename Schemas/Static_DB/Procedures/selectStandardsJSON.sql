DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'ONLY_FULL_GROUP_BY,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION'
$$
CREATE PROCEDURE `selectStandardsJSON`()
  DETERMINISTIC
BEGIN

  SELECT
    JSON_ARRAYAGG(JSON_OBJECT('key', s.id,
    'standard', s.name,
    'materials', (selectMaterials_has_Standard(s.id)),
    'enviroments', (selectEnviroments_has_Standard(s.id)),
    'endCaps', (selectEndCaps_has_Standard(s.id)),
    'conditionalPeriods', (selectConditionalPeriods_has_Standard(s.id))
    )) AS `standards`
  FROM standard s;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE selectStandardsJSON TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE selectStandardsJSON TO 'manager'@'%';
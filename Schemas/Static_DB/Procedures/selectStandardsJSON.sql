DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
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
    'conditionalPeriods', (selectConditionalPeriods_has_Standard(s.id)),
    'testTypes', (selectTest_Type(s.id))
    )) AS `standards`
  FROM standard s;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE selectStandardsJSON TO 'databaseManager'@'%';
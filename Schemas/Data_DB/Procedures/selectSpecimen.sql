DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE PROCEDURE `selectSpecimen`(IN idSpecimen int UNSIGNED)
  DETERMINISTIC
BEGIN

  SELECT
    s.id AS `idSpecimen`,
    s.sample AS `idSample`,
    s.enviroment AS `enviroment`,
    s.testName AS `testName`,
    s.operator AS `operator`,
    s.endCap AS `endCap`
  FROM specimen s
  WHERE s.id = idSpecimen;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE selectSpecimen TO 'reporting'@'%';
DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE PROCEDURE `selectSampleID`(IN standard varchar(25), IN material varchar(10), IN specification varchar(6), IN diamnom int UNSIGNED, IN diamreal int UNSIGNED, IN wallthick int UNSIGNED, IN lenfree int UNSIGNED, IN lentotal int UNSIGNED, IN targetpressure int, IN targettemp int)
  DETERMINISTIC
BEGIN

  SELECT
    ts.id AS idSample
  FROM sample ts
  WHERE (ts.standard LIKE standard
  AND ts.material LIKE material
  AND ts.specification LIKE specification
  AND ts.diamreal = diamreal
  AND ts.diamnom = diamnom
  AND ts.wallthick = wallthick
  AND ts.lenfree = lenfree
  AND ts.lentotal = lentotal
  AND ts.targettemp = targettemp
  AND ts.targetpressure = targetpressure);

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE selectSampleID TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE selectSampleID TO 'reporting'@'%';
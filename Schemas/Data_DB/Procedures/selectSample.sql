DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE PROCEDURE `selectSample`(IN idSample int UNSIGNED)
  DETERMINISTIC
BEGIN

  SELECT
    s.id AS `idSample`,
    s.standard AS `standard`,
    s.material AS `material`,
    s.specification AS `specification`,
    s.diamreal AS `diamreal`,
    s.diamnom AS `diamnom`,
    s.wallthick AS `wallthickness`,
    s.lenfree AS `lenfree`,
    s.lentotal AS `lentotal`,
    s.condPeriod AS `condPeriod`,
    s.targettemp AS `targettemp`,
    s.targetpressure AS `targetpressure`
  FROM sample s
  WHERE s.id = idSample;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE selectSample TO 'dataCollector'@'%';
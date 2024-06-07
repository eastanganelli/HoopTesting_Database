DELIMITER $$

CREATE PROCEDURE `insertEnviroment`(IN idStandard INT UNSIGNED, IN insideFluid VARCHAR(30), IN outsideFluid VARCHAR(30))
  DETERMINISTIC
BEGIN

  DECLARE elements int UNSIGNED;

  SELECT
    COUNT(*) INTO elements
  FROM enviroment e
  WHERE e.standard = idStandard
  AND e.inside LIKE insideFluid
  AND e.outside LIKE outsideFluid;

  IF elements = 0 THEN
    INSERT HIGH_PRIORITY INTO enviroment (standard, inside, outside)
      VALUES (idStandard, insideFluid, outsideFluid);

    SELECT
      e.id AS `key`,
      e.inside AS `insideFluid`,
      e.outside AS `outsideFluid`
    FROM enviroment e
    WHERE e.standard = idStandard
    AND e.inside LIKE insideFluid
    AND e.outside LIKE outsideFluid;

  ELSE
    SELECT
      'Already Exist!' AS `response`;
  END IF;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE insertEnviroment TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE insertEnviroment TO 'databaseManager'@'%';
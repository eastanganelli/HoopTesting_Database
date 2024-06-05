DELIMITER $$

CREATE PROCEDURE `insertEnviroment`(IN idStandard INT UNSIGNED, IN insertFluid VARBINARY(15), IN outFluid VARBINARY(15))
  DETERMINISTIC
BEGIN

  DECLARE elements int UNSIGNED;

  SELECT
    COUNT(*)
  FROM enviroment e
  WHERE e.standard = idStandard
  AND e.insertFluid LIKE insertFluid
  AND e.outFluid = outFluid;

  IF elements = 0 THEN
    INSERT HIGH_PRIORITY INTO enviroment (standard, insertFluid, outFluid)
      VALUES (idStandard, insertFluid, outFluid);

    SELECT
      e.id AS `key`,
      e.insertFluid AS `insertFluid`,
      e.outFluid AS `outsideFluid`
    FROM enviroment e
    WHERE e.standard = idStandard
    AND e.insertFluid LIKE insertFluid
    AND e.outFluid = outFluid;

  ELSE
    SELECT
      'Already Exist!' AS `response`;
  END IF;

END
$$

DELIMITER ;
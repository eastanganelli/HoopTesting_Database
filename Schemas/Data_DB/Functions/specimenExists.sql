DELIMITER $$

CREATE FUNCTION `specimenExists`(idSample INT UNSIGNED, start VARBINARY(255))
  RETURNS INT(11) UNSIGNED
  DETERMINISTIC
BEGIN

  DECLARE idSpecimen boolean;

  SELECT
    ts.id INTO idSpecimen
  FROM specimen ts
  WHERE (ts.sample = idSample
  AND ts.start = start)
  LIMIT 1;

  RETURN idSpecimen;
END
$$

DELIMITER ;
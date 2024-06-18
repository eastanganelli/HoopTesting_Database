DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE FUNCTION `specimenExists`(idSample int UNSIGNED, start varbinary(255))
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
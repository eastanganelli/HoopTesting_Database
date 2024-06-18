DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE FUNCTION `countSpecimens`(idSpecimen int UNSIGNED)
  RETURNS INT(11) UNSIGNED
  DETERMINISTIC
BEGIN

  SET @count = 0;

  SELECT
    COUNT(*) INTO @count
  FROM specimen ts
  WHERE ts.sample = (SELECT
      se.sample
    FROM specimen se
    WHERE se.id = idSpecimen)
  GROUP BY ts.sample;

  RETURN @count;
END
$$

DELIMITER ;
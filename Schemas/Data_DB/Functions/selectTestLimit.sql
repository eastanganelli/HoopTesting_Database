DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE FUNCTION `selectTestLimit`(idSpecimen int UNSIGNED, isASC tinyint UNSIGNED)
  RETURNS DATETIME
  DETERMINISTIC
BEGIN

  SET @Time = NULL;

  IF isASC = 0 THEN
    SELECT
      td.createdAt INTO @Time
    FROM data td
    WHERE td.specimen = idSpecimen
    ORDER BY td.createdAt ASC LIMIT 1;
  ELSE
    SELECT
      td.createdAt INTO @Time
    FROM data td
    WHERE td.specimen = idSpecimen
    ORDER BY td.createdAt DESC LIMIT 1;
  END IF;

  RETURN @Time;
END
$$

DELIMITER ;
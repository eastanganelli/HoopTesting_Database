DELIMITER $$

CREATE FUNCTION `selectTestLimit`(idSpecimen INT UNSIGNED, isASC TINYINT UNSIGNED)
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
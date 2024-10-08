﻿DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE FUNCTION `selectTestNumber`(idSpecimen int UNSIGNED)
  RETURNS INT(11) UNSIGNED
  DETERMINISTIC
BEGIN
  SET @testNumber = 0;

  SET @sampleID = (SELECT
      ts.sample
    FROM specimen ts
    WHERE ts.id = idSpecimen);

  SELECT
    COUNT(*) INTO @testNumber
  FROM specimen ts
  WHERE ts.id <= idSpecimen
  AND ts.sample = @sampleID
  GROUP BY ts.sample;

  RETURN @testNumber;
END
$$

DELIMITER ;
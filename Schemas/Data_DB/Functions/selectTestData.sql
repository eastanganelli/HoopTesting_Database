DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE FUNCTION `selectTestData`(idSpecimen int UNSIGNED)
  RETURNS JSON
  DETERMINISTIC
BEGIN

  SET @returnData = NULL;

  SET @initTime = (SELECT
      td.createdAt
    FROM data td
    WHERE td.specimen = idSpecimen
    ORDER BY td.createdAt ASC LIMIT 1);

  WITH groupingData
  AS
  (SELECT
      td.createdAt,
      AVG(td.pressure) AS 'pressure',
      AVG(td.temperature) AS 'temperature'
    FROM data td
    WHERE td.specimen = idSpecimen
    GROUP BY td.createdAt)

  SELECT
    JSON_ARRAYAGG(JSON_OBJECT('key',
    TIMESTAMPDIFF(SECOND, @initTime, gd.createdAt),
    'pressure',
    gd.pressure,
    'temperature',
    gd.temperature)) INTO @returnData
  FROM groupingData gd;

  RETURN @returnData;
END
$$

DELIMITER ;
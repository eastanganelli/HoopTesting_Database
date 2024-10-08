﻿DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE PROCEDURE `selectTestData`(IN idSpecimen int UNSIGNED)
  DETERMINISTIC
BEGIN

  SET @initTime = (SELECT
      td.createdAt
    FROM data td
    WHERE td.specimen = idSpecimen
    ORDER BY td.createdAt ASC LIMIT 1);

  --   WITH groupingData
  --   AS
  --   (SELECT
  --       td.createdAt,
  --       AVG(td.pressure) AS 'pressure',
  --       AVG(td.temperature) AS 'temperature'
  --     FROM data td
  --     WHERE td.specimen = idSpecimen
  --     GROUP BY td.createdAt)
  -- 
  --   SELECT
  --     TIMESTAMPDIFF(SECOND, @initTime, gd.createdAt) AS 'key',
  --     gd.pressure AS 'pressure',
  --     gd.temperature AS 'temperature'
  --   FROM groupingData gd;

  SELECT
    TIMESTAMPDIFF(HOUR, @initTime, d.createdAt) AS `key`,
    d.pressure AS `pressure`,
    d.temperature AS `temperature`
  FROM data d
  WHERE d.specimen = idSpecimen
  AND TIMESTAMPDIFF(SECOND, @initTime, d.createdAt) % 3600 = 0;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE selectTestData TO 'reportGenerator'@'%';
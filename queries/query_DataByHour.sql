SET @firstValue = (SELECT
    d.createdAt AS firstVal
  FROM data d
  WHERE d.specimen = 48
  LIMIT 1);

-- SELECT
--   d.pressure,
--   d.temperature,
--  @firstValue,
--   d.createdAt,
--   TIMESTAMPDIFF(MINUTE, @firstValue, d.createdAt)
-- FROM data d
-- WHERE d.specimen = 48;

-- SELECT
--   AVG(d.pressure),
--   AVG(d.temperature),
--   TIMESTAMPDIFF(HOUR, @firstValue, d.createdAt) AS timestampDiff
-- FROM data d
-- WHERE d.specimen = 48
-- GROUP BY timestampDiff;

SELECT
  d.pressure,
  d.temperature,
  TIMESTAMPDIFF(HOUR, @firstValue, d.createdAt) AS mytime
FROM data d
WHERE d.specimen = 48
 AND TIMESTAMPDIFF(SECOND, @firstValue, d.createdAt) % 3600 = 0;
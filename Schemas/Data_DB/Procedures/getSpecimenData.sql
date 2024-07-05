DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE PROCEDURE `getSpecimenData`(IN mySpecimenID int UNSIGNED)
  DETERMINISTIC
BEGIN

  WITH myResult
  AS
  (SELECT
      td.id,
      td.pressure,
      td.temperature,
      (TIMESTAMPDIFF(MICROSECOND, (SELECT
          td2.createdAt
        FROM data td2
        WHERE td2.specimen = mySpecimenID LIMIT 1), td.createdAt)) AS `difference`
    FROM data td
    WHERE td.specimen = mySpecimenID)

  SELECT
    ts.id AS `idTest`,
    (SELECT
        JSON_ARRAYAGG(JSON_OBJECT('id', r.id, 'pressure', r.pressure, 'temperature', r.temperature, 'timekey', r.difference))
      FROM myResult r) AS `testData`
  FROM specimen ts
    INNER JOIN sample ss
      ON ts.sample = ss.id
  WHERE ts.id = mySpecimenID;

END
$$

DELIMITER ;
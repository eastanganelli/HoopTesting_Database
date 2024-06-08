DELIMITER $$

CREATE PROCEDURE `getSpecimenData`(IN mySpecimenID INT UNSIGNED)
  DETERMINISTIC
BEGIN

  CREATE TEMPORARY TABLE IF NOT EXISTS myResult AS (SELECT
      td.id,
      td.pressure,
      td.temperature,
      # td.createdAt,
      (TIMESTAMPDIFF(MICROSECOND, (SELECT
          td2.createdAt
        FROM data td2
        WHERE td2.specimen = mySpecimenID LIMIT 1), td.createdAt)) AS `difference`
    FROM data td
    WHERE td.specimen = mySpecimenID);

  SELECT
    ts.id AS `idTest`,
    (SELECT
        JSON_ARRAYAGG(JSON_OBJECT('id', r.id, 'pressure', r.pressure, 'temperature', r.temperature, 'timekey', r.difference))
      FROM myResult r) AS `testData`
  FROM specimen ts
    INNER JOIN sample ts1
      ON ts.sample = ts1.id
  WHERE ts.id = mySpecimenID;

  DROP TEMPORARY TABLE IF EXISTS myResult;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE getSpecimenData TO 'reporting'@'%';
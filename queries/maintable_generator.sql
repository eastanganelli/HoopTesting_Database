USE STEL_DB_DATA;


SELECT
  ts.id AS idSample,
  ts.standard AS standard,
  ts.material AS material,
  (SELECT
      JSON_ARRAYAGG(
      JSON_OBJECT('idSpecimen', ts1.id, 'operator', ts1.operator, 'begin', (SELECT td.createdAt FROM test_data td WHERE td.test_specimen = ts1.id ORDER BY td.createdAt ASC LIMIT 1), 'end', (SELECT td.createdAt FROM test_data td WHERE td.test_specimen = ts1.id ORDER BY td.createdAt DESC LIMIT 1))
      )
    FROM test_specimen ts1
    WHERE ts1.test_sample = ts.id) AS mySpecimens
FROM test_sample ts;
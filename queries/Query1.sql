SELECT
  test_specimen.id,
  test_specimen.operator,
  test_specimen.enviromental,
  (SELECT
      td.createdAt
    FROM test_data td
    WHERE td.test_specimen = test_specimen.id
    ORDER BY td.createdAt ASC LIMIT 1) AS 'init',
  (SELECT
      td.createdAt
    FROM test_data td
    WHERE td.test_specimen = test_specimen.id
    ORDER BY td.createdAt DESC LIMIT 1) AS 'ended',
  test_sample.standard,
  test_sample.material,
  test_sample.specification,
  test_sample.diamreal,
  test_sample.diamnom,
  test_sample.wallthick,
  test_sample.lenfree,
  test_sample.lentotal,
  test_sample.condPeriod,
  test_sample.targetpressure,
  test_sample.targettemp,
  (DATEDIFF('ended','init')) AS `Duration`
FROM test_specimen
  INNER JOIN test_sample
    ON test_specimen.test_sample = test_sample.id
WHERE test_specimen.id = 82
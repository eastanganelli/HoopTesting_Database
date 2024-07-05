DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE FUNCTION `selectTestsSpecimens`(idSample int UNSIGNED)
  RETURNS JSON
  DETERMINISTIC
BEGIN
  SET @myResult = NULL;

  WITH preResults
  AS
  (SELECT
      ts.id,
      ts.targetPressure,
      ts.targetTemperature,
      ts.operator,
      selectTestNumber(ts.id) AS testNumber,
      (selectTestLimit(ts.id, 0)) AS beginTime,
      (selectTestLimit(ts.id, 1)) AS endTime
    FROM specimen ts
    WHERE ts.sample = idSample)

  (SELECT
      JSON_ARRAYAGG(JSON_OBJECT('idSpecimen', pr.id,
      'targetPressure', pr.targetPressure,
      'targetTemperature', pr.targetTemperature,
      'operator', pr.operator,
      'testNumber', pr.testNumber,
      'beginTime', DATE_FORMAT(pr.beginTime, '%d/%m/%Y %H:%i:%s'),
      'endTime', DATE_FORMAT(pr.endTime, '%d/%m/%Y %H:%i:%s'),
      'duration', DATE_FORMAT(TIMEDIFF(pr.endTime, pr.beginTime), '%H:%i:%s'))) INTO @myResult
    FROM preResults pr
    ORDER BY pr.id DESC);

  RETURN @myResult;
END
$$

DELIMITER ;
DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE FUNCTION `selectTestSpecimen`(idSpecimen int UNSIGNED)
  RETURNS JSON
  DETERMINISTIC
BEGIN

  SET @result = NULL;

  SET @countSpecimens = countSpecimens(idSpecimen);

  SET @beginTime = selectTestLimit(idSpecimen, 0);

  SET @endTime = selectTestLimit(idSpecimen, 1);

  SET @testNumber = selectTestNumber(idSpecimen);

  SELECT
    JSON_OBJECT('idSpecimen',
    se.id,
    'targetTemperature',
    se.targetTemperature,
    'targetPressure',
    se.targetpressure,
    'operator',
    se.operator,
    'enviroment',
    se.enviroment,
    'beginTime',
    DATE_FORMAT(@beginTime,
    '%d/%m/%Y %H:%i:%s'),
    'endTime',
    DATE_FORMAT(@endTime,
    '%d/%m/%Y %H:%i:%s'),
    'duration',
    DATE_FORMAT(TIMEDIFF(@endTime,
    @beginTime),
    '%H:%i:%s'),
    'counts',
    @countSpecimens,
    'testNumber',
    @testNumber,
    'testName',
    se.testName,
    'endCap',
    se.endCap,
    'hoopStress',
    (hoopStress(se.sample, se.targetPressure)),
    'fail',
    se.failText,
    'remark',
    se.remark) INTO @result
  FROM specimen se
  WHERE se.id = idSpecimen;

  RETURN @result;
END
$$

DELIMITER ;
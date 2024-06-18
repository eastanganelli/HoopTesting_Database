DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE FUNCTION `selectTestSample`(idSample int UNSIGNED)
  RETURNS JSON
  DETERMINISTIC
BEGIN

  SET @result = NULL;

  SELECT
    JSON_OBJECT('idSample',
    sa.id,
    'standard',
    sa.standard,
    'material',
    sa.material,
    'specification',
    sa.specification,
    'diameterReal',
    sa.diamreal,
    'diameterNominal',
    sa.diamnom,
    'wallThickness',
    sa.wallthick,
    'lengthTotal',
    sa.lentotal,
    'lengthFree',
    sa.lenfree,
    'targetTemperature',
    sa.targettemp,
    'targetPressure',
    sa.targetpressure,
    'hoopStress',
    ((sa.targettemp * (sa.diamreal - sa.wallthick)) / (10 * 2 * sa.wallthick)),
    'conditionalPeriod',
    sa.condPeriod) INTO @result
  FROM sample sa
  WHERE sa.id = idSample;

  RETURN @result;
END
$$

DELIMITER ;
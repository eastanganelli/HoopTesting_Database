DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE PROCEDURE `selectTests`()
  DETERMINISTIC
BEGIN

  SELECT
    ts.id AS idSample,
    ts.standard AS standard,
    ts.material AS material,
    selectTestsSpecimens(ts.id) AS mySpecimens
  FROM sample ts;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE selectTests TO 'reportGenerator'@'%';
GRANT EXECUTE ON PROCEDURE selectTests TO 'reporting'@'%';
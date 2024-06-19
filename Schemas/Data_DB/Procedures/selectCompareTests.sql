DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE PROCEDURE `selectCompareTests`(IN arraySpecimens text)
  DETERMINISTIC
BEGIN

  SELECT
    (selectTestSample(sa.id)) AS 'mySample',
    (selectTestSpecimen(se.id)) AS 'mySpecimen',
    (selectTestData(se.id)) AS 'myData'
  FROM specimen se
    INNER JOIN sample sa
      ON se.sample = sa.id
  WHERE FIND_IN_SET(se.id, arraySpecimens) > 0;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE selectCompareTests TO 'reportGenerator'@'%';
GRANT EXECUTE ON PROCEDURE selectCompareTests TO 'reporting'@'%';
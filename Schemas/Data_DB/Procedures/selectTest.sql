DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE PROCEDURE `selectTest`(IN idSpecimen int UNSIGNED)
  DETERMINISTIC
BEGIN

  SELECT
    (selectTestSample(sa.id)) AS 'mySample',
    (selectTestSpecimen(se.id)) AS 'mySpecimen'
  FROM specimen se
    INNER JOIN sample sa
      ON se.sample = sa.id
  WHERE se.id = idSpecimen;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE selectTest TO 'reporting'@'%';
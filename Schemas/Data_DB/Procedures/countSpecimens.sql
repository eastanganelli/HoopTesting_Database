DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE PROCEDURE `countSpecimens`(IN idSample int UNSIGNED)
  DETERMINISTIC
  COMMENT 'Count Specimens by an Sample ID'
BEGIN

  SELECT
    COUNT(ts.sample) AS counts
  FROM specimen ts
  WHERE ts.sample = idSample;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE countSpecimens TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE countSpecimens TO 'databaseManager'@'%';
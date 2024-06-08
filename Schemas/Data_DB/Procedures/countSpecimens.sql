DELIMITER $$

CREATE PROCEDURE `countSpecimens`(IN idSample INT UNSIGNED)
  DETERMINISTIC
BEGIN

  SELECT
    COUNT(ts.sample) AS counts
  FROM specimen ts
  WHERE ts.sample = idSample;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE countSpecimens TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE countSpecimens TO 'reporting'@'%';
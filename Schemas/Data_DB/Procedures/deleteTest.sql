DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE PROCEDURE `deleteTest`(IN idSpecimen int UNSIGNED)
BEGIN

  DELETE LOW_PRIORITY QUICK
    FROM specimen ts
  WHERE ts.id = idSpecimen;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE deleteTest TO 'reporting'@'%';
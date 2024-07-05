DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE PROCEDURE `insertData`(IN idSpecimen int UNSIGNED, IN pressure double, IN temperature double)
BEGIN

  INSERT INTO data (specimen, pressure, temperature, createdAt)
    VALUES (idSpecimen, pressure, temperature, NOW());

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE insertData TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE insertData TO 'databaseManager'@'%';
DELIMITER $$

CREATE PROCEDURE `insertData`(IN idSpecimen INT UNSIGNED, IN pressure DOUBLE, IN temperature DOUBLE)
BEGIN

  INSERT INTO data (specimen, pressure, temperature, createdAt)
    VALUES (idSpecimen, pressure, temperature, NOW());

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE insertData TO 'dataCollector'@'%';
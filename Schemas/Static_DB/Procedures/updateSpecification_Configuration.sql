DELIMITER $$

CREATE PROCEDURE `updateSpecification_Configuration`(IN id int UNSIGNED, IN timeIN smallint, IN timeTypeIN varchar(1), IN temperatureIN tinyint)
  DETERMINISTIC
BEGIN

  DECLARE result text;

  IF (existSpecification_Configuration(id) = TRUE) THEN
    UPDATE LOW_PRIORITY specification_configuration sc
    SET sc.id = id,
        sc.time = timeIN,
        sc.timeType = timeTypeIN,
        sc.temperature = temperatureIN
    WHERE sc.id = id;

    SELECT
      'Successful Updated!' INTO result;
  ELSE
    SELECT
      'Unsuccessful Updated!' INTO result;
  END IF;

  SELECT
    result AS response;
END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE updateSpecification_Configuration TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE updateSpecification_Configuration TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE updateSpecification_Configuration TO 'manager'@'%';
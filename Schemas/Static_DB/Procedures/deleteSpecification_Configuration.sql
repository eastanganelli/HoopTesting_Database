DELIMITER $$

CREATE PROCEDURE `deleteSpecification_Configuration`(IN id INT UNSIGNED)
  DETERMINISTIC
BEGIN

  IF(existSpecification_Configuration(id) = TRUE) THEN
    DELETE LOW_PRIORITY QUICK
      FROM specification_configuration sc
      WHERE sc.id = id
      LIMIT 1;
    
    SELECT
      'Successful Deleted!' AS `response`;
  ELSE
    SELECT
      'Unsuccessful Deleted!' AS `response`;
  END IF;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE deleteSpecification_Configuration TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE deleteSpecification_Configuration TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE deleteSpecification_Configuration TO 'manager'@'%';
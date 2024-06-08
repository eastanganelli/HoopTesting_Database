DELIMITER $$

CREATE PROCEDURE `deleteSpecification`(IN id INT UNSIGNED)
  DETERMINISTIC
BEGIN

  IF(existSpecification(id) = TRUE) THEN
    DELETE LOW_PRIORITY QUICK
      FROM specification s
      WHERE s.id = id
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

GRANT EXECUTE ON PROCEDURE deleteSpecification TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE deleteSpecification TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE deleteSpecification TO 'manager'@'%';
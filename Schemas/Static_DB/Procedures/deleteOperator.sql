DELIMITER $$

CREATE PROCEDURE `deleteOperator`(IN id INT UNSIGNED)
  DETERMINISTIC
BEGIN

  IF(existOperator(id) = TRUE) THEN
    DELETE LOW_PRIORITY QUICK
      FROM operator o
      WHERE o.id = id
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

GRANT EXECUTE ON PROCEDURE deleteOperator TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE deleteOperator TO 'manager'@'%';
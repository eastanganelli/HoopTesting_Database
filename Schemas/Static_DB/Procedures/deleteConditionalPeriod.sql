DELIMITER $$

CREATE PROCEDURE `deleteConditionalPeriod`(IN id int UNSIGNED)
  DETERMINISTIC
BEGIN

  IF (exist(id) = TRUE) THEN
    DELETE LOW_PRIORITY QUICK
      FROM conditional_period cp
    WHERE cp.id = id
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

GRANT EXECUTE ON PROCEDURE deleteConditionalPeriod TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE deleteConditionalPeriod TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE deleteConditionalPeriod TO 'manager'@'%';
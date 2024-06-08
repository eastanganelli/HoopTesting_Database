DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'ONLY_FULL_GROUP_BY,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION'
$$
CREATE PROCEDURE `deleteStandard`(IN id int UNSIGNED)
  DETERMINISTIC
BEGIN

  IF (existStandard(id) = TRUE) THEN
    DELETE LOW_PRIORITY QUICK
      FROM standard s
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

GRANT EXECUTE ON PROCEDURE deleteStandard TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE deleteStandard TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE deleteStandard TO 'manager'@'%';
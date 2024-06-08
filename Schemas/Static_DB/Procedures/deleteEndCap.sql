DELIMITER $$

CREATE PROCEDURE `deleteEndCap`(IN id int UNSIGNED)
  DETERMINISTIC
BEGIN

  IF (existEndCap(id) = TRUE) THEN
    DELETE LOW_PRIORITY QUICK
      FROM endcap cp
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

GRANT EXECUTE ON PROCEDURE deleteEndCap TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE deleteEndCap TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE deleteEndCap TO 'manager'@'%';
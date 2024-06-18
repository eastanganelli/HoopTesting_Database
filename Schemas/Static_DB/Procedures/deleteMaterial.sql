DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE PROCEDURE `deleteMaterial`(IN id int UNSIGNED)
  DETERMINISTIC
BEGIN

  IF (existMaterial(id) = TRUE) THEN
    DELETE LOW_PRIORITY QUICK
      FROM material m
    WHERE m.id = id
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

GRANT EXECUTE ON PROCEDURE deleteMaterial TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE deleteMaterial TO 'manager'@'%';
DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE PROCEDURE `deleteSpecification_Configuration`(IN id int UNSIGNED)
  DETERMINISTIC
BEGIN

  IF (existSpecification_Configuration(id) = TRUE) THEN
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

GRANT EXECUTE ON PROCEDURE deleteSpecification_Configuration TO 'databaseManager'@'%';
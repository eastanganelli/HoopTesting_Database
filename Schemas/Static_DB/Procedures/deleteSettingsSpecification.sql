DELIMITER $$

CREATE PROCEDURE `deleteSettingsSpecification`(IN id INT UNSIGNED)
  DETERMINISTIC
BEGIN

  IF (existSettingsSpecification(id) = TRUE) THEN
    DELETE LOW_PRIORITY QUICK
      FROM settings_specification sc
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

GRANT EXECUTE ON PROCEDURE deleteSettingsSpecification TO 'databaseManager'@'%';
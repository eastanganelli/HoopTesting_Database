DELIMITER $$

CREATE PROCEDURE `deleteEnviroment`(IN id int UNSIGNED)
  DETERMINISTIC
BEGIN

  IF (existEnviroment(id) = TRUE) THEN
    DELETE LOW_PRIORITY QUICK
      FROM enviroment e
    WHERE e.id = id
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
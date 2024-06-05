DELIMITER $$

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
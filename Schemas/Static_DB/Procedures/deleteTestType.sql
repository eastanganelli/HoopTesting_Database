﻿DELIMITER $$

CREATE PROCEDURE `deleteTestType`(IN id int UNSIGNED)
  DETERMINISTIC
BEGIN

  IF (existTest_Type(id) = TRUE) THEN
    DELETE LOW_PRIORITY QUICK
      FROM test_type tt
    WHERE tt.id = id
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

GRANT EXECUTE ON PROCEDURE deleteTestType TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE deleteTestType TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE deleteTestType TO 'manager'@'%';
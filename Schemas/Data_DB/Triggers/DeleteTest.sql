DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE TRIGGER `DeleteTest`
	BEFORE DELETE
	ON specimen
	FOR EACH ROW
BEGIN

  DELETE LOW_PRIORITY QUICK
    FROM data td
  WHERE td.specimen = OLD.id;

END
$$

DELIMITER ;
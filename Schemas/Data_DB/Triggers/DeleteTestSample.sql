DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE TRIGGER `DeleteTestSample`
	AFTER DELETE
	ON specimen
	FOR EACH ROW
BEGIN

  SET @countTests = 0;

  SELECT
    COUNT(*) INTO @countTests
  FROM specimen ts
  WHERE ts.sample = OLD.sample;

  IF @countTests < 1 THEN

    DELETE LOW_PRIORITY QUICK
      FROM sample
    WHERE sample.id = OLD.sample;

  END IF;

END
$$

DELIMITER ;
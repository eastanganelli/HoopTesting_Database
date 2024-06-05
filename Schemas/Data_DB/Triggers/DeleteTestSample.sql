DELIMITER $$

CREATE TRIGGER `DeleteTestSample`
	AFTER DELETE
	ON specimen
	FOR EACH ROW
BEGIN
  
  set @countTests = 0;

  SELECT COUNT(*) INTO @countTests
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
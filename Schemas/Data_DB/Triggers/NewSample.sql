DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE TRIGGER `NewSample`
	BEFORE INSERT
	ON sample
	FOR EACH ROW
BEGIN

  DECLARE row_id int UNSIGNED;

  SELECT
    s.id INTO row_id
  FROM sample s
  WHERE s.standard LIKE NEW.standard
  AND s.material LIKE NEW.material
  AND s.specification LIKE NEW.specification
  AND s.diamreal = NEW.diamreal
  AND s.diamnom = NEW.diamnom
  AND s.lentotal = NEW.lentotal
  AND s.lenfree = NEW.lenfree
  AND s.wallthick = NEW.wallthick
  AND s.targettemp = new.targettemp
  AND s.targetpressure = NEW.targetpressure;

  IF row_id IS NOT NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = row_id;
  END IF;

END
$$

DELIMITER ;
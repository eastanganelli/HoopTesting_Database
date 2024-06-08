DELIMITER $$

CREATE PROCEDURE `updateStandard`(IN id int UNSIGNED, IN nameIN varchar(60))
  DETERMINISTIC
BEGIN

  DECLARE result text;

  IF (existStandard(id) = TRUE) THEN
    UPDATE LOW_PRIORITY standard s
    SET s.id = id,
        s.name = nameIN
    WHERE s.id = id;

    SELECT
      'Successful Updated!' INTO result;
  ELSE
    SELECT
      'Unsucessful Updated!' INTO result;
  END IF;

  SELECT
    result AS `response`;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE updateStandard TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE updateStandard TO 'databaseManager'@'%';
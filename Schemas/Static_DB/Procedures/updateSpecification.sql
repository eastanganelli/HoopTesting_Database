DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE PROCEDURE `updateSpecification`(IN id int UNSIGNED, IN nameIN varchar(20), IN descriptionIN varchar(80))
  DETERMINISTIC
BEGIN

  DECLARE result text;

  IF (existSpecification(id) = TRUE) THEN
    UPDATE LOW_PRIORITY specification s
    SET s.id = id,
        s.name = nameIN,
        s.description = descriptionIN
    WHERE s.id = id;

    SELECT
      'Successful Updated!' INTO result;
  ELSE
    SELECT
      'Unsuccessful Updated!' INTO result;
  END IF;

  SELECT
    result AS `response`;
END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE updateSpecification TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE updateSpecification TO 'manager'@'%';
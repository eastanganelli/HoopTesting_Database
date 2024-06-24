DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE PROCEDURE `updateMaterial`(IN id int UNSIGNED, IN nameIN varchar(20), IN descriptionIN varchar(80))
  DETERMINISTIC
BEGIN

  DECLARE result text;

  IF (existMaterial(id) = TRUE) THEN
    UPDATE LOW_PRIORITY material m
    SET m.id = id,
        m.name = nameIN,
        m.description = descriptionIN
    WHERE m.id = id;

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

GRANT EXECUTE ON PROCEDURE updateMaterial TO 'databaseManager'@'%';
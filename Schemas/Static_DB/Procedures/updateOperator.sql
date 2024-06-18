DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE PROCEDURE `updateOperator`(IN id int UNSIGNED, IN dni int UNSIGNED, IN name varchar(50), IN familyname varchar(50))
  DETERMINISTIC
BEGIN

  DECLARE result text;

  IF (existOperator(id) = TRUE) THEN
    UPDATE LOW_PRIORITY operator o
    SET o.dni = dni,
        o.name = name,
        o.familyname = familyname
    WHERE o.id = id;

    SELECT
      'Successful Updated!' INTO result;
  ELSE
    SELECT
      'Unsuccessful Updated!' INTO result;
  END IF;

  SELECT
    result AS response;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE updateOperator TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE updateOperator TO 'manager'@'%';
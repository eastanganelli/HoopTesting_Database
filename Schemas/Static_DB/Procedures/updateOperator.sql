DELIMITER $$

CREATE PROCEDURE `updateOperator`(IN id INT UNSIGNED, IN dni INT UNSIGNED, IN name VARCHAR(50), IN familyname VARCHAR(50))
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

GRANT EXECUTE ON PROCEDURE updateOperator TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE updateOperator TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE updateOperator TO 'manager'@'%';
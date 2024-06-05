DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'ONLY_FULL_GROUP_BY,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION'
$$
CREATE PROCEDURE `insertOperator`(IN dni int UNSIGNED, IN name varchar(20), IN familyname varchar(30))
  DETERMINISTIC
BEGIN

  DECLARE selected bigint;

  SELECT count(*) INTO selected FROM operator o WHERE o.dni = dni;

  IF (selected = 0) THEN
    INSERT INTO operator (dni, name, familyname)
      VALUES (dni, name, familyname);

    SELECT
      o.id AS `key`,
      o.dni AS `dni`,
      o.name AS `name`,
      o.familyname AS `familyName`
    FROM operator o
    WHERE o.dni = dni;

  ELSE
    SELECT
      'Already Exists!' AS `response`;
  END IF;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE insertOperator TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE insertOperator TO 'manager'@'%';
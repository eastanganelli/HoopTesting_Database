DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'ONLY_FULL_GROUP_BY,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION'
$$
CREATE PROCEDURE `insertMaterial`(IN nameIN varchar(20), IN descriptionIN varchar(60))
  DETERMINISTIC
BEGIN

  DECLARE selected bigint;
  DECLARE result json;

  SELECT
    COUNT(*) INTO selected
  FROM material m
  WHERE m.name LIKE nameIN;

  IF (selected = 0) THEN
    INSERT INTO material (name, description)
      VALUES (nameIN, descriptionIN);

    SELECT
      m.id AS `key`,
      m.name AS `material`,
      m.description AS `description`,
      '[]' AS `specifications`
    FROM material m
    WHERE m.name = nameIN;

  ELSE
    SELECT
      'Already Exists!' AS `response`;
  END IF;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE insertMaterial TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE insertMaterial TO 'manager'@'%';
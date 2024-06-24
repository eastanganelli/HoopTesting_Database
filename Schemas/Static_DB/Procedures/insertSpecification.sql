DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE PROCEDURE `insertSpecification`(IN materialIN int UNSIGNED, IN nameIN varchar(20), IN descriptionIN varchar(60))
  DETERMINISTIC
BEGIN

  DECLARE selected bigint;

  SELECT
    COUNT(*) INTO selected
  FROM specification s
  WHERE s.name = nameIN
  AND s.material = materialIN;

  IF (selected = 0) THEN
    INSERT INTO specification (material, name, description)
      VALUES (materialIN, nameIN, descriptionIN);

    SELECT
      s.id AS `key`,
      s.name AS `specification`,
      s.description AS `description`,
      '[]' AS `configurations`
    FROM specification s
    WHERE s.name LIKE nameIN;

  ELSE
    SELECT
      'Already Exists!' AS `response`;
  END IF;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE insertSpecification TO 'databaseManager'@'%';
DELIMITER $$

CREATE PROCEDURE `insertEndCap`(IN idStandard int UNSIGNED, IN endCap varbinary(15))
  DETERMINISTIC
BEGIN

  DECLARE elements int UNSIGNED;

  SELECT
    COUNT(*) into elements
  FROM endcap ec
  WHERE ec.name = endCap
  AND ec.name = endCap;

  IF elements = 0 THEN
    INSERT HIGH_PRIORITY INTO endcap (standard, name)
      VALUES (idStandard, endCap);

    SELECT
      ec.id AS `key`,
      ec.name AS `endcap`
    FROM endcap ec
    WHERE ec.name = endCap
    AND ec.name = endCap;

  ELSE
    SELECT
      'Already Exist!' AS `response`;
  END IF;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE insertEndCap TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE insertEndCap TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE insertEndCap TO 'manager'@'%';
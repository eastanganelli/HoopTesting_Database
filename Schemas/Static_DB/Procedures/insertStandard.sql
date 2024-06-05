DELIMITER $$

CREATE PROCEDURE `insertStandard`(IN nameIn varchar(40))
  DETERMINISTIC
BEGIN

  DECLARE elements int UNSIGNED;

  SELECT
    COUNT(*)
  FROM standard s
  WHERE s.name LIKE nameIn;

  IF elements = 0 THEN
    INSERT HIGH_PRIORITY INTO standard (name)
      VALUES (nameIn);

    SELECT
      s.id AS `key`,
      s.name AS `standard`,
      '[]' AS `materials`,
      '[]' AS `enviroments`,
      '[]' AS `endCaps`,
      '[]' AS conditionalPeriods
    FROM standard s
    WHERE s.name LIKE nameIn;

  ELSE
    SELECT
      'Already Exist!' AS `response`;
  END IF;

END
$$

DELIMITER ;
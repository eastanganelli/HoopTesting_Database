DELIMITER $$

CREATE PROCEDURE `selectEndCaps`(IN idStandard INT UNSIGNED)
BEGIN

  SELECT
    e.id AS `id`,
    e.name AS `endCap`
  FROM endcap e
  WHERE e.standard = idStandard;

END
$$

DELIMITER ;
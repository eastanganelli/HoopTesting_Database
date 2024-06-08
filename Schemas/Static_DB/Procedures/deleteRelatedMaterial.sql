DELIMITER $$

CREATE PROCEDURE `deleteRelatedMaterial`(IN id int UNSIGNED)
  DETERMINISTIC
BEGIN

  IF (existRelatedMaterial(id) = TRUE) THEN
    DELETE LOW_PRIORITY QUICK
      FROM material_has_standard mhs
    WHERE mhs.id = id
    LIMIT 1;

    SELECT
      'Successful Deleted!' AS `response`;
  ELSE
    SELECT
      'Unsuccessful Deleted!' AS `response`;
  END IF;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE deleteRelatedMaterial TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE deleteRelatedMaterial TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE deleteRelatedMaterial TO 'manager'@'%';
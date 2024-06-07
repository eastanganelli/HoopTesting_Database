DELIMITER $$

CREATE PROCEDURE `selectStandarsComplete`()
  DETERMINISTIC
BEGIN

  SELECT
    s.id,
    s.name,
    (SELECT
        JSON_ARRAYAGG(JSON_OBJECT('id', e.id,
        'endcap', e.name))
      FROM endcap e
      WHERE e.standard = s.id) AS `endCaps`,
    (SELECT
        JSON_ARRAYAGG(JSON_OBJECT('id', e.id,
        'insertFluid', e.inside,
        'outsideFluid', e.outside))
      FROM enviroment e
      WHERE e.standard = s.id) AS `enviroment`,
    (SELECT
        JSON_ARRAYAGG(JSON_OBJECT('id', cp.id,
        'minwall', cp.minwall,
        'maxwall', cp.maxwall,
        'time', cp.time))
      FROM conditional_period cp
      WHERE cp.standard = s.id) AS conditionalPeriod,
      (
        SELECT
          JSON_ARRAYAGG(JSON_OBJECT(
            'id', mhs.id,
            'idMaterial', mhs.material,
            'material', m.name,
            'description', m.description
          ))
        FROM material_has_standard mhs
        INNER JOIN material m ON mhs.material = m.id
        WHERE mhs.standard = s.id
      ) AS relatedMaterial
  FROM standard s;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE selectStandarsComplete TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE selectStandarsComplete TO 'databaseManager'@'%';
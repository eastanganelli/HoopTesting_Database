SELECT
  s.id,
  s.name,
  (
    SELECT
      JSON_ARRAYAGG(JSON_OBJECT(
        'id', e.id,
        'type', e.encap
      ))
    FROM endcap e
    WHERE e.standard = s.id
  ) AS `endCaps`,
  (
    SELECT
      JSON_ARRAYAGG(JSON_OBJECT(
        'id', e.id,
        'insertFluid', e.insertFluid,
        'outsideLfuid', e.outFluid
      ))
    FROM enviroment e
    WHERE e.standard = s.id
  ) AS `enviroment`,
  (
    SELECT
      JSON_ARRAYAGG(JSON_OBJECT(
        'id', cp.id,
        'minwall', cp.minwall,
        'maxwall', cp.maxwall,
        'time', cp.time 
      ))
    FROM conditional_period cp
    WHERE cp.standard = s.id
  ) AS conditionalPeriod
FROM standard s
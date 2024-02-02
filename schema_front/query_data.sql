USE STEL_DB_STATIC;

#
# CALL getStandardTree();

## Testing Specifications by Material
#CALL getSpecificationsByMaterial();

# CALL getConcPeriodsbyStandard(0);

# CALL getStandardSpecsDataList(0);

# CALL getDataBySpecAndStandard(1,0);

/*
CREATE TEMPORARY TABLE IF NOT EXISTS testing(
SELECT
m.id AS idMaterial
FROM period_by_specification pbs
INNER JOIN specification s ON pbs.specification = s.id
INNER JOIN material m ON s.material = m.id
WHERE pbs.standard = 0
GROUP BY idMaterial, pbs.standard
);

SELECT
pbs.standard AS idStandard,
pbs.specification AS idSpecification
FROM period_by_specification pbs
INNER JOIN specification s ON pbs.specification = s.id
WHERE pbs.standard = 0 AND s.material IN (SELECT * FROM testing)
GROUP BY idSpecification;
*/

/*
SELECT
pbs.standard AS idStandard,
m.id AS idMaterial,
m.name AS materialName,
m.type AS materialType,
s.id AS idSpecification,
s.name AS specificationName,
pbs.temperature AS temperature,
pbs.hours AS hours,
pbs.seconds AS seconds
FROM period_by_specification pbs
INNER JOIN specification s ON pbs.specification = s.id
INNER JOIN material m ON s.material = m.id;
*/

# CALL get_SpecificationByStandard(0,0);
CALL get_ConditionalPeriodsbyStandard(0);
###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Functions](Functions.md)>selectSpecifications


# ![logo](../../../../../Images/function64.svg) selectSpecifications

## <a name="#Description"></a>Description
> 
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|SQL Access|CONTAINS SQL|
|Deterministic|True|
|Security|Definer|
|Definer|root|
|SQL Mode|NO_AUTO_VALUE_ON_ZERO|
|Language|SQL|
|Created|11/6/2024 11:06:02|
|Last Modified|11/6/2024 11:06:02|


## <a name="#Parameters"></a>Parameters
|Name|Data Type|Length|Precision|Scale|
|---|---|---|---|---|
|idMaterial|INT||11||
|(Result)|JSON|0|||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
FUNCTION selectSpecifications (idMaterial int UNSIGNED)
RETURNS json
DETERMINISTIC
BEGIN

  DECLARE result json;
  DECLARE elements tinyint;

  SELECT
    COUNT(*) INTO elements
  FROM specification s
  WHERE s.material = idMaterial;

  IF (elements > 0) THEN
    SELECT
      JSON_ARRAYAGG(JSON_OBJECT('key', s.id,
      'specification', s.name,
      'description', (IF(s.description IS NULL, '', s.description)),
      'configurations', (selectSpecification_Configurations(s.id)))) INTO result
    FROM specification s
    WHERE s.material = idMaterial;
  ELSE
    SELECT
      '[]' INTO result;
  END IF;

  RETURN result;
END
```

## <a name="#DependsOn"></a>Depends On _`2`_
- ![Table](../../../../../Images/table.svg) [specification](../Tables/specification.md)
- ![Function](../../../../../Images/function.svg) [selectSpecification_Configurations](selectSpecification_Configurations.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 25/06/2024|
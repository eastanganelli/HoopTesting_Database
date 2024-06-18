###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Functions](Functions.md)>selectMaterials_has_Standard


# ![logo](../../../../../Images/function64.svg) selectMaterials_has_Standard

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
|idStandard|INT||11||
|(Result)|JSON|0|||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
FUNCTION selectMaterials_has_Standard (idStandard int UNSIGNED)
RETURNS json
DETERMINISTIC
BEGIN

  DECLARE result json;
  DECLARE elements tinyint;

  SELECT
    COUNT(*) INTO elements
  FROM material_has_standard mhs
  WHERE mhs.standard = idStandard;

  IF (elements > 0) THEN
    SELECT
      JSON_ARRAYAGG(JSON_OBJECT('key', mhs.id,
      'idMaterial', mhs.material,
      'material', m.name,
      'descriptioin', m.description)) INTO result
    FROM material_has_standard mhs
      INNER JOIN material m
        ON m.id = mhs.standard
    WHERE mhs.standard = idStandard;
  ELSE
    SELECT
      '[]' INTO result;
  END IF;

  RETURN result;
END
```

## <a name="#DependsOn"></a>Depends On _`2`_
- ![Table](../../../../../Images/table.svg) [material_has_standard](../Tables/material_has_standard.md)
- ![Table](../../../../../Images/table.svg) [material](../Tables/material.md)


## <a name="#UsedBy"></a>Used By _`1`_
- ![Procedure](../../../../../Images/procedure.svg) [selectStandardsJSON](../Procedures/selectStandardsJSON.md)


||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 18/06/2024|
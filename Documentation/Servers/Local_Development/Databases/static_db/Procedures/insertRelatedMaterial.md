###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Procedures](Procedures.md)>insertRelatedMaterial


# ![logo](../../../../../Images/procedure64.svg) insertRelatedMaterial

## <a name="#Description"></a>Description
> 
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|SQL Access|CONTAINS SQL|
|Deterministic|False|
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
|idMaterial|INT||11||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
PROCEDURE insertRelatedMaterial (IN idStandard int UNSIGNED, IN idMaterial int UNSIGNED)
BEGIN

  DECLARE elements int UNSIGNED;

  SELECT
    COUNT(*) INTO elements
  FROM material_has_standard mhs
  WHERE mhs.material = idMaterial
  AND mhs.standard = idStandard;

  IF elements = 0 THEN
    INSERT HIGH_PRIORITY INTO material_has_standard (material, standard)
      VALUES (idMaterial, idStandard);

    SELECT
      mhs.id AS `key`,
      m.id AS `idMaterial`,
      m.name AS `material`
    FROM material_has_standard mhs
      INNER JOIN material m
        ON mhs.material = m.id
    WHERE mhs.material = idMaterial
    AND mhs.standard = idStandard;

  ELSE
    SELECT
      'Already Exist!' AS `response`;
  END IF;

END
```

## <a name="#DependsOn"></a>Depends On _`4`_
- ![User](../../../../../Images/user.svg) [databaseManager@%](../../../Users/databaseManager@%.md)
- ![Table](../../../../../Images/table.svg) [material_has_standard](../Tables/material_has_standard.md)
- ![Table](../../../../../Images/table.svg) [material](../Tables/material.md)
- ![Table](../../../../../Images/table.svg) [standard](../Tables/standard.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 18/06/2024|
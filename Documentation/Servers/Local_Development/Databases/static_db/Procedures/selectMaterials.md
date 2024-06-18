###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Procedures](Procedures.md)>selectMaterials


# ![logo](../../../../../Images/procedure64.svg) selectMaterials

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

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
PROCEDURE selectMaterials (IN idStandard int UNSIGNED)
DETERMINISTIC
BEGIN

  SELECT
    mhs.material AS idMaterial,
    m.name AS materialName,
    m.description AS materialDescription,
    mhs.type AS materialType
  FROM material m
    INNER JOIN material_has_standard mhs
      ON m.id = mhs.material
  WHERE mhs.standard = standard;

END
```

## <a name="#DependsOn"></a>Depends On _`5`_
- ![User](../../../../../Images/user.svg) [dataCollector@%](../../../Users/dataCollector@%.md)
- ![User](../../../../../Images/user.svg) [databaseManager@%](../../../Users/databaseManager@%.md)
- ![Table](../../../../../Images/table.svg) [material](../Tables/material.md)
- ![Table](../../../../../Images/table.svg) [material_has_standard](../Tables/material_has_standard.md)
- ![Table](../../../../../Images/table.svg) [standard](../Tables/standard.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 18/06/2024|
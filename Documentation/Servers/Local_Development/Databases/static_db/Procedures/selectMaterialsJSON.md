###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Procedures](Procedures.md)>selectMaterialsJSON


# ![logo](../../../../../Images/procedure64.svg) selectMaterialsJSON

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


## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
PROCEDURE selectMaterialsJSON ()
DETERMINISTIC
BEGIN

  SELECT
    JSON_ARRAYAGG(JSON_OBJECT('key', m.id,
    'material', m.name,
    'description', (IF(m.description IS NULL, 'Sin Descripción', m.description)),
    'specifications', (selectSpecifications(m.id)))) AS `materials`
  FROM material m;

END
```

## <a name="#DependsOn"></a>Depends On _`3`_
- ![User](../../../../../Images/user.svg) [databaseManager@%](../../../Users/databaseManager@%.md)
- ![Procedure](../../../../../Images/procedure.svg) [selectSpecifications](selectSpecifications.md)
- ![Table](../../../../../Images/table.svg) [material](../Tables/material.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 18/06/2024|
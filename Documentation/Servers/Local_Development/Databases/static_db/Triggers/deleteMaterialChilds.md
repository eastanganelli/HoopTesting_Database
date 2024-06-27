###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Triggers](Triggers.md)>deleteMaterialChilds


# ![logo](../../../../../Images/trigger64.svg) deleteMaterialChilds


## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Definer|root|
|SQL Mode|NO_AUTO_VALUE_ON_ZERO|
|Event|DELETE|
|Timing|BEFORE|
|Follows||
|Precedes||
|Created|11/6/2024 11:06:04|


## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
TRIGGER deleteMaterialChilds
BEFORE DELETE
ON material
FOR EACH ROW
BEGIN

  DECLARE childsCount int UNSIGNED;

  SELECT
    COUNT(*) INTO childsCount
  FROM specification s
  WHERE s.material = OLD.id;

  IF childsCount > 0 THEN
    DELETE LOW_PRIORITY QUICK
      FROM specification s
    WHERE s.material = OLD.id;

  END IF;

  SELECT
    COUNT(*) INTO childsCount
  FROM material_has_standard mhs
  WHERE mhs.material = OLD.id;

  IF childsCount > 0 THEN
    DELETE LOW_PRIORITY QUICK
      FROM material_has_standard mhs
    WHERE mhs.material = OLD.id;

  END IF;

END
```

## <a name="#DependsOn"></a>Depends On _`3`_
- ![Table](../../../../../Images/table.svg) [material](../Tables/material.md)
- ![Table](../../../../../Images/table.svg) [specification](../Tables/specification.md)
- ![Table](../../../../../Images/table.svg) [material_has_standard](../Tables/material_has_standard.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 26/06/2024|
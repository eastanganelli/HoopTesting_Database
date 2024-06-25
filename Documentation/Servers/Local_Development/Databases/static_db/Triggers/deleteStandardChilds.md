###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Triggers](Triggers.md)>deleteStandardChilds


# ![logo](../../../../../Images/trigger64.svg) deleteStandardChilds


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
TRIGGER deleteStandardChilds
BEFORE DELETE
ON standard
FOR EACH ROW
BEGIN

  DECLARE elements int UNSIGNED;

  SELECT
    COUNT(*) INTO elements
  FROM endcap e
  WHERE e.standard = OLD.id;

  IF elements > 0 THEN
    DELETE LOW_PRIORITY QUICK
      FROM endcap e
    WHERE e.standard = OLD.id;
  END IF;

  SELECT
    COUNT(*) INTO elements
  FROM conditional_period cp
  WHERE cp.standard = OLD.id;

  IF elements > 0 THEN
    DELETE LOW_PRIORITY QUICK
      FROM conditional_period cp
    WHERE cp.standard = OLD.id;
  END IF;

  SELECT
    COUNT(*) INTO elements
  FROM enviroment e
  WHERE e.standard = OLD.id;

  IF elements > 0 THEN
    DELETE LOW_PRIORITY QUICK
      FROM enviroment e
    WHERE e.standard = OLD.id;
  END IF;

  SELECT
    COUNT(*) INTO elements
  FROM test_type tt
  WHERE tt.standard = OLD.id;

  IF elements > 0 THEN
    DELETE LOW_PRIORITY QUICK
      FROM test_type tt
    WHERE tt.standard = OLD.id;
  END IF;

  SELECT
    COUNT(*) INTO elements
  FROM material_has_standard mhs
  WHERE mhs.standard = OLD.id;

  IF elements > 0 THEN
    DELETE LOW_PRIORITY QUICK
      FROM material_has_standard mhs
    WHERE mhs.standard = OLD.id;
  END IF;

END
```

## <a name="#DependsOn"></a>Depends On _`6`_
- ![Table](../../../../../Images/table.svg) [standard](../Tables/standard.md)
- ![Table](../../../../../Images/table.svg) [endcap](../Tables/endcap.md)
- ![Table](../../../../../Images/table.svg) [conditional_period](../Tables/conditional_period.md)
- ![Table](../../../../../Images/table.svg) [enviroment](../Tables/enviroment.md)
- ![Table](../../../../../Images/table.svg) [test_type](../Tables/test_type.md)
- ![Table](../../../../../Images/table.svg) [material_has_standard](../Tables/material_has_standard.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 25/06/2024|
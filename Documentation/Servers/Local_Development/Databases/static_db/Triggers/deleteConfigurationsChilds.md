###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Triggers](Triggers.md)>deleteConfigurationsChilds


# ![logo](../../../../../Images/trigger64.svg) deleteConfigurationsChilds


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
TRIGGER deleteConfigurationsChilds
BEFORE DELETE
ON specification
FOR EACH ROW
BEGIN

  DECLARE childsCount int UNSIGNED;

  SELECT
    COUNT(*) INTO childsCount
  FROM specification_configuration sc
  WHERE sc.specification = OLD.id;

  IF childsCount > 0 THEN
    DELETE LOW_PRIORITY QUICK
      FROM specification_configuration sc
    WHERE sc.specification = OLD.id;

  END IF;

END
```

## <a name="#DependsOn"></a>Depends On _`2`_
- ![Table](../../../../../Images/table.svg) [specification](../Tables/specification.md)
- ![Table](../../../../../Images/table.svg) [specification_configuration](../Tables/specification_configuration.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 26/06/2024|
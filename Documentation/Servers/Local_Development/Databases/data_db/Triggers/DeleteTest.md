###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[data_db](../data_db.md)>[Triggers](Triggers.md)>DeleteTest


# ![logo](../../../../../Images/trigger64.svg) DeleteTest


## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Definer|root|
|SQL Mode|NO_AUTO_VALUE_ON_ZERO|
|Event|DELETE|
|Timing|BEFORE|
|Follows||
|Precedes||
|Created|11/6/2024 11:05:48|


## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
TRIGGER DeleteTest
BEFORE DELETE
ON specimen
FOR EACH ROW
BEGIN

  DELETE LOW_PRIORITY QUICK
    FROM data td
  WHERE td.specimen = OLD.id;

END
```

## <a name="#DependsOn"></a>Depends On _`2`_
- ![Table](../../../../../Images/table.svg) [specimen](../Tables/specimen.md)
- ![Table](../../../../../Images/table.svg) [data](../Tables/data.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 18/06/2024|
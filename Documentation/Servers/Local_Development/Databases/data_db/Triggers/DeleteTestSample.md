###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[data_db](../data_db.md)>[Triggers](Triggers.md)>DeleteTestSample


# ![logo](../../../../../Images/trigger64.svg) DeleteTestSample


## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Definer|root|
|SQL Mode|NO_AUTO_VALUE_ON_ZERO|
|Event|DELETE|
|Timing|AFTER|
|Follows||
|Precedes||
|Created|11/6/2024 11:05:48|


## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
TRIGGER DeleteTestSample
AFTER DELETE
ON specimen
FOR EACH ROW
BEGIN

  SET @countTests = 0;

  SELECT
    COUNT(*) INTO @countTests
  FROM specimen ts
  WHERE ts.sample = OLD.sample;

  IF @countTests < 1 THEN

    DELETE LOW_PRIORITY QUICK
      FROM sample
    WHERE sample.id = OLD.sample;

  END IF;

END
```

## <a name="#DependsOn"></a>Depends On _`2`_
- ![Table](../../../../../Images/table.svg) [specimen](../Tables/specimen.md)
- ![Table](../../../../../Images/table.svg) [sample](../Tables/sample.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 18/06/2024|
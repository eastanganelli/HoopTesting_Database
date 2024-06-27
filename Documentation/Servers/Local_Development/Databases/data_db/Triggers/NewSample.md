###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[data_db](../data_db.md)>[Triggers](Triggers.md)>NewSample


# ![logo](../../../../../Images/trigger64.svg) NewSample


## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Definer|root|
|SQL Mode|NO_AUTO_VALUE_ON_ZERO|
|Event|INSERT|
|Timing|BEFORE|
|Follows||
|Precedes||
|Created|11/6/2024 11:05:48|


## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
TRIGGER NewSample
BEFORE INSERT
ON sample
FOR EACH ROW
BEGIN

  DECLARE row_id int UNSIGNED;

  SELECT
    s.id INTO row_id
  FROM sample s
  WHERE s.standard LIKE NEW.standard
  AND s.material LIKE NEW.material
  AND s.specification LIKE NEW.specification
  AND s.diamreal = NEW.diamreal
  AND s.diamnom = NEW.diamnom
  AND s.lentotal = NEW.lentotal
  AND s.lenfree = NEW.lenfree
  AND s.wallthick = NEW.wallthick
  AND s.targettemp = new.targettemp
  AND s.targetpressure = NEW.targetpressure;

  IF row_id IS NOT NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = row_id;
  END IF;

END
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Table](../../../../../Images/table.svg) [sample](../Tables/sample.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 26/06/2024|
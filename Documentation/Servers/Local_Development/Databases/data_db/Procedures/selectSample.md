###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[data_db](../data_db.md)>[Procedures](Procedures.md)>selectSample


# ![logo](../../../../../Images/procedure64.svg) selectSample

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
|Created|11/6/2024 11:05:27|
|Last Modified|11/6/2024 11:05:27|


## <a name="#Parameters"></a>Parameters
|Name|Data Type|Length|Precision|Scale|
|---|---|---|---|---|
|idSample|INT||11||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
PROCEDURE selectSample (IN idSample int UNSIGNED)
DETERMINISTIC
BEGIN

  SELECT
    s.id AS `idSample`,
    s.standard AS `standard`,
    s.material AS `material`,
    s.specification AS `specification`,
    s.diamreal AS `diamreal`,
    s.diamnom AS `diamnom`,
    s.wallthick AS `wallthickness`,
    s.lenfree AS `lenfree`,
    s.lentotal AS `lentotal`,
    s.condPeriod AS `condPeriod`,
    s.targettemp AS `targettemp`,
    s.targetpressure AS `targetpressure`
  FROM sample s
  WHERE s.id = idSample;

END
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Table](../../../../../Images/table.svg) [sample](../Tables/sample.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 18/06/2024|
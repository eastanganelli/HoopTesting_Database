###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[data_db](../data_db.md)>[Procedures](Procedures.md)>selectSampleID


# ![logo](../../../../../Images/procedure64.svg) selectSampleID

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
|standard|VARCHAR|25|||
|material|VARCHAR|10|||
|specification|VARCHAR|6|||
|diamnom|INT||11||
|diamreal|INT||11||
|wallthick|INT||11||
|lenfree|INT||11||
|lentotal|INT||11||
|targetpressure|INT||11||
|targettemp|INT||11||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
PROCEDURE selectSampleID (IN standard varchar(25), IN material varchar(10), IN specification varchar(6), IN diamnom int UNSIGNED, IN diamreal int UNSIGNED, IN wallthick int UNSIGNED, IN lenfree int UNSIGNED, IN lentotal int UNSIGNED, IN targetpressure int, IN targettemp int)
DETERMINISTIC
BEGIN

  SELECT
    ts.id AS idSample
  FROM sample ts
  WHERE (ts.standard LIKE standard
  AND ts.material LIKE material
  AND ts.specification LIKE specification
  AND ts.diamreal = diamreal
  AND ts.diamnom = diamnom
  AND ts.wallthick = wallthick
  AND ts.lenfree = lenfree
  AND ts.lentotal = lentotal
  AND ts.targettemp = targettemp
  AND ts.targetpressure = targetpressure);

END
```

## <a name="#DependsOn"></a>Depends On _`2`_
- ![User](../../../../../Images/user.svg) [dataCollector@%](../../../Users/dataCollector@%.md)
- ![Table](../../../../../Images/table.svg) [sample](../Tables/sample.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 18/06/2024|
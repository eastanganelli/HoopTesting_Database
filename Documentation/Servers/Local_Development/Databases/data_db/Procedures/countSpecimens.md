###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[data_db](../data_db.md)>[Procedures](Procedures.md)>countSpecimens


# ![logo](../../../../../Images/procedure64.svg) countSpecimens

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
PROCEDURE countSpecimens (IN idSample int UNSIGNED)
DETERMINISTIC
BEGIN

  SELECT
    COUNT(ts.sample) AS counts
  FROM specimen ts
  WHERE ts.sample = idSample;

END
```

## <a name="#DependsOn"></a>Depends On _`2`_
- ![User](../../../../../Images/user.svg) [dataCollector@%](../../../Users/dataCollector@%.md)
- ![Table](../../../../../Images/table.svg) [specimen](../Tables/specimen.md)


## <a name="#UsedBy"></a>Used By _`1`_
- ![Function](../../../../../Images/function.svg) [selectTestSpecimen](../Functions/selectTestSpecimen.md)


||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 25/06/2024|
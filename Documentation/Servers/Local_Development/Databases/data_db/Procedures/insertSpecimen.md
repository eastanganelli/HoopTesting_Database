###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[data_db](../data_db.md)>[Procedures](Procedures.md)>insertSpecimen


# ![logo](../../../../../Images/procedure64.svg) insertSpecimen

## <a name="#Description"></a>Description
> 
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|SQL Access|CONTAINS SQL|
|Deterministic|False|
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
|operatorName|VARCHAR|40|||
|enviromentIn|VARCHAR|20|||
|testNameIn|VARCHAR|120|||
|endCapIn|VARCHAR|10|||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
PROCEDURE insertSpecimen (IN idSample int UNSIGNED, IN operatorName varchar(40), IN enviromentIn varchar(20), IN testNameIn varchar(120), IN endCapIn varchar(10))
BEGIN

  INSERT INTO specimen (sample, operator, enviroment, testName, endCap, createdAt, updatedAt)
    VALUES (idSample, operatorName, enviromentIn, testNameIn, endCapIn, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());

  SELECT
    ts.id AS `idSpecimen`
  FROM specimen ts
  ORDER BY ts.id DESC
  LIMIT 1;

END
```

## <a name="#DependsOn"></a>Depends On _`3`_
- ![User](../../../../../Images/user.svg) [dataCollector@%](../../../Users/dataCollector@%.md)
- ![Table](../../../../../Images/table.svg) [specimen](../Tables/specimen.md)
- ![Table](../../../../../Images/table.svg) [sample](../Tables/sample.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 25/06/2024|
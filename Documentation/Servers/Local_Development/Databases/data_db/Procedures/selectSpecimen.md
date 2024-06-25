###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[data_db](../data_db.md)>[Procedures](Procedures.md)>selectSpecimen


# ![logo](../../../../../Images/procedure64.svg) selectSpecimen

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
|idSpecimen|INT||11||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
PROCEDURE selectSpecimen (IN idSpecimen int UNSIGNED)
DETERMINISTIC
BEGIN

  SELECT
    s.id AS `idSpecimen`,
    s.sample AS `idSample`,
    s.enviroment AS `enviroment`,
    s.testName AS `testName`,
    s.operator AS `operator`,
    s.endCap AS `endCap`
  FROM specimen s
  WHERE s.id = idSpecimen;

END
```

## <a name="#DependsOn"></a>Depends On _`2`_
- ![User](../../../../../Images/user.svg) [dataCollector@%](../../../Users/dataCollector@%.md)
- ![Table](../../../../../Images/table.svg) [specimen](../Tables/specimen.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 25/06/2024|
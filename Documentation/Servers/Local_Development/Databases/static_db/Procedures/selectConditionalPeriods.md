###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Procedures](Procedures.md)>selectConditionalPeriods


# ![logo](../../../../../Images/procedure64.svg) selectConditionalPeriods

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
|Created|11/6/2024 11:06:02|
|Last Modified|11/6/2024 11:06:02|


## <a name="#Parameters"></a>Parameters
|Name|Data Type|Length|Precision|Scale|
|---|---|---|---|---|
|idStandard|INT||11||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
PROCEDURE selectConditionalPeriods (IN idStandard int UNSIGNED)
DETERMINISTIC
BEGIN

  SELECT
    cp.id AS idCondPeriod,
    cp.minwall AS minWall,
    cp.maxwall AS maxWall,
    cp.time AS condPeriod
  FROM conditional_period cp
  WHERE cp.standard = idStandard
  ORDER BY cp.minwall;

END
```

## <a name="#DependsOn"></a>Depends On _`3`_
- ![User](../../../../../Images/user.svg) [dataCollector@%](../../../Users/dataCollector@%.md)
- ![User](../../../../../Images/user.svg) [databaseManager@%](../../../Users/databaseManager@%.md)
- ![Table](../../../../../Images/table.svg) [conditional_period](../Tables/conditional_period.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 18/06/2024|
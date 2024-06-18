###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[data_db](../data_db.md)>[Procedures](Procedures.md)>deleteTest


# ![logo](../../../../../Images/procedure64.svg) deleteTest

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
|idSpecimen|INT||11||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
PROCEDURE deleteTest (IN idSpecimen int UNSIGNED)
BEGIN

  DELETE LOW_PRIORITY QUICK
    FROM specimen ts
  WHERE ts.id = idSpecimen;

END
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Table](../../../../../Images/table.svg) [specimen](../Tables/specimen.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 18/06/2024|
###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[data_db](../data_db.md)>[Procedures](Procedures.md)>updateSpecimen


# ![logo](../../../../../Images/procedure64.svg) updateSpecimen

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
|testName|VARCHAR|150|||
|operator|VARCHAR|40|||
|fail|VARCHAR|255|||
|remark|VARCHAR|255|||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
PROCEDURE updateSpecimen (IN idSpecimen int UNSIGNED, IN testName varchar(150), IN operator varchar(40), IN fail varchar(255), IN remark varchar(255))
BEGIN

  UPDATE LOW_PRIORITY specimen ts
  SET ts.testName = testName,
      ts.operator = operator,
      ts.failText = fail,
      ts.remark = remark,
      ts.updatedAt = CURRENT_TIMESTAMP()
  WHERE ts.id = idSpecimen;

END
```

## <a name="#DependsOn"></a>Depends On _`2`_
- ![User](../../../../../Images/user.svg) [reportGenerator@%](../../../Users/reportGenerator@%.md)
- ![Table](../../../../../Images/table.svg) [specimen](../Tables/specimen.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 26/06/2024|
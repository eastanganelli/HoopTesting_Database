###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Procedures](Procedures.md)>selectStandardsJSON


# ![logo](../../../../../Images/procedure64.svg) selectStandardsJSON

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
|Created|12/6/2024 22:38:42|
|Last Modified|12/6/2024 22:38:42|


## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
PROCEDURE selectStandardsJSON ()
DETERMINISTIC
BEGIN

  SELECT
    JSON_ARRAYAGG(JSON_OBJECT('key', s.id,
    'standard', s.name,
    'materials', (selectMaterials_has_Standard(s.id)),
    'enviroments', (selectEnviroments_has_Standard(s.id)),
    'endCaps', (selectEndCaps_has_Standard(s.id)),
    'conditionalPeriods', (selectConditionalPeriods_has_Standard(s.id)),
    'testTypes', (selectTest_Type(s.id)))) AS `standards`
  FROM standard s;

END
```

## <a name="#DependsOn"></a>Depends On _`7`_
- ![User](../../../../../Images/user.svg) [databaseManager@%](../../../Users/databaseManager@%.md)
- ![Function](../../../../../Images/function.svg) [selectMaterials_has_Standard](../Functions/selectMaterials_has_Standard.md)
- ![Function](../../../../../Images/function.svg) [selectEnviroments_has_Standard](../Functions/selectEnviroments_has_Standard.md)
- ![Function](../../../../../Images/function.svg) [selectEndCaps_has_Standard](../Functions/selectEndCaps_has_Standard.md)
- ![Function](../../../../../Images/function.svg) [selectConditionalPeriods_has_Standard](../Functions/selectConditionalPeriods_has_Standard.md)
- ![Function](../../../../../Images/function.svg) [selectTest_Type](../Functions/selectTest_Type.md)
- ![Table](../../../../../Images/table.svg) [standard](../Tables/standard.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 18/06/2024|
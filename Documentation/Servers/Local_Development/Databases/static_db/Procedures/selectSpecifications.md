###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Procedures](Procedures.md)>selectSpecifications


# ![logo](../../../../../Images/procedure64.svg) selectSpecifications

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
|Created|11/6/2024 11:06:01|
|Last Modified|11/6/2024 11:06:01|


## <a name="#Parameters"></a>Parameters
|Name|Data Type|Length|Precision|Scale|
|---|---|---|---|---|
|idMaterial|INT||11||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
PROCEDURE selectSpecifications (IN idMaterial int UNSIGNED)
DETERMINISTIC
BEGIN

  SELECT
    s.id AS idSpecification,
    s.name AS nameSpecification,
    s.description AS descriptionSpecification
  FROM specification s
  WHERE s.material = idMaterial;

END
```

## <a name="#DependsOn"></a>Depends On _`3`_
- ![User](../../../../../Images/user.svg) [dataCollector@%](../../../Users/dataCollector@%.md)
- ![User](../../../../../Images/user.svg) [databaseManager@%](../../../Users/databaseManager@%.md)
- ![Table](../../../../../Images/table.svg) [specification](../Tables/specification.md)


## <a name="#UsedBy"></a>Used By _`1`_
- ![Procedure](../../../../../Images/procedure.svg) [selectMaterialsJSON](selectMaterialsJSON.md)


||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 18/06/2024|
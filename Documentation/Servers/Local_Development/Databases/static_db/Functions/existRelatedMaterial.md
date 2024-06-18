###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Functions](Functions.md)>existRelatedMaterial


# ![logo](../../../../../Images/function64.svg) existRelatedMaterial

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
|id|INT||11||
|(Result)|TINYINT||1||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
FUNCTION existRelatedMaterial (id int UNSIGNED)
RETURNS tinyint(1)
DETERMINISTIC
BEGIN

  DECLARE selected bigint(255);
  SELECT
    COUNT(*) INTO selected
  FROM material_has_standard mhs
  WHERE mhs.id = id;

  IF selected != 1 THEN
    RETURN FALSE;
  ELSE
    RETURN TRUE;
  END IF;

END
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Table](../../../../../Images/table.svg) [material_has_standard](../Tables/material_has_standard.md)


## <a name="#UsedBy"></a>Used By _`1`_
- ![Procedure](../../../../../Images/procedure.svg) [deleteRelatedMaterial](../Procedures/deleteRelatedMaterial.md)


||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 18/06/2024|
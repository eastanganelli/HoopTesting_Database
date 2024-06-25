###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Procedures](Procedures.md)>selectStandarsComplete


# ![logo](../../../../../Images/procedure64.svg) selectStandarsComplete

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


## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
PROCEDURE selectStandarsComplete ()
DETERMINISTIC
BEGIN

  SELECT
    s.id,
    s.name,
    (SELECT
        JSON_ARRAYAGG(JSON_OBJECT('id', e.id,
        'endcap', e.name))
      FROM endcap e
      WHERE e.standard = s.id) AS `endCaps`,
    (SELECT
        JSON_ARRAYAGG(JSON_OBJECT('id', e.id,
        'insertFluid', e.inside,
        'outsideFluid', e.outside))
      FROM enviroment e
      WHERE e.standard = s.id) AS `enviroment`,
    (SELECT
        JSON_ARRAYAGG(JSON_OBJECT('id', cp.id,
        'minwall', cp.minwall,
        'maxwall', cp.maxwall,
        'time', cp.time))
      FROM conditional_period cp
      WHERE cp.standard = s.id) AS conditionalPeriod,
    (SELECT
        JSON_ARRAYAGG(JSON_OBJECT('id', mhs.id,
        'idMaterial', mhs.material,
        'material', m.name,
        'description', m.description))
      FROM material_has_standard mhs
        INNER JOIN material m
          ON mhs.material = m.id
      WHERE mhs.standard = s.id) AS relatedMaterial
  FROM standard s;

END
```

## <a name="#DependsOn"></a>Depends On _`6`_
- ![Table](../../../../../Images/table.svg) [endcap](../Tables/endcap.md)
- ![Table](../../../../../Images/table.svg) [enviroment](../Tables/enviroment.md)
- ![Table](../../../../../Images/table.svg) [conditional_period](../Tables/conditional_period.md)
- ![Table](../../../../../Images/table.svg) [material_has_standard](../Tables/material_has_standard.md)
- ![Table](../../../../../Images/table.svg) [material](../Tables/material.md)
- ![Table](../../../../../Images/table.svg) [standard](../Tables/standard.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 25/06/2024|
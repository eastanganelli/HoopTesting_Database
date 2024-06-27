###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Procedures](Procedures.md)>insertEnviroment


# ![logo](../../../../../Images/procedure64.svg) insertEnviroment

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
|Created|26/6/2024 20:38:57|
|Last Modified|26/6/2024 20:38:57|


## <a name="#Parameters"></a>Parameters
|Name|Data Type|Length|Precision|Scale|
|---|---|---|---|---|
|idStandard|INT||11||
|insideFluid|VARCHAR|30|||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
PROCEDURE insertEnviroment (IN idStandard int UNSIGNED, IN insideFluid varchar(30))
DETERMINISTIC
BEGIN

  DECLARE elements int UNSIGNED;

  SELECT
    COUNT(*) INTO elements
  FROM enviroment e
  WHERE e.standard = idStandard
  AND e.inside LIKE insideFluid;
  #AND e.outside LIKE outsideFluid;

  IF elements = 0 THEN
    INSERT HIGH_PRIORITY INTO enviroment (standard, inside)
      VALUES (idStandard, insideFluid);

    SELECT
      e.id AS `key`,
      e.inside AS `insideFluid`
    #      e.outside AS `outsideFluid`
    FROM enviroment e
    WHERE e.standard = idStandard
    AND e.inside LIKE insideFluid;
  #    AND e.outside LIKE outsideFluid;

  ELSE
    SELECT
      'Already Exist!' AS `response`;
  END IF;

END
```

## <a name="#DependsOn"></a>Depends On _`3`_
- ![User](../../../../../Images/user.svg) [databaseManager@%](../../../Users/databaseManager@%.md)
- ![Table](../../../../../Images/table.svg) [enviroment](../Tables/enviroment.md)
- ![Table](../../../../../Images/table.svg) [standard](../Tables/standard.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 26/06/2024|
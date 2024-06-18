###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Procedures](Procedures.md)>insertStandard


# ![logo](../../../../../Images/procedure64.svg) insertStandard

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
|nameIn|VARCHAR|40|||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
PROCEDURE insertStandard (IN nameIn varchar(40))
DETERMINISTIC
BEGIN

  DECLARE elements int UNSIGNED;

  SELECT
    COUNT(*) INTO elements
  FROM standard s
  WHERE s.name = nameIn;

  IF elements = 0 THEN
    INSERT HIGH_PRIORITY INTO standard (name)
      VALUES (nameIn);

    SELECT
      s.id AS `key`,
      s.name AS `standard`,
      '[]' AS `materials`,
      '[]' AS `enviroments`,
      '[]' AS `endCaps`,
      '[]' AS conditionalPeriods
    FROM standard s
    WHERE s.name LIKE nameIn;

  ELSE
    SELECT
      'Already Exist!' AS `response`;
  END IF;

END
```

## <a name="#DependsOn"></a>Depends On _`2`_
- ![User](../../../../../Images/user.svg) [databaseManager@%](../../../Users/databaseManager@%.md)
- ![Table](../../../../../Images/table.svg) [standard](../Tables/standard.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 18/06/2024|
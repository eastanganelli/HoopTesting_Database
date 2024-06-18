###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Procedures](Procedures.md)>insertMaterial


# ![logo](../../../../../Images/procedure64.svg) insertMaterial

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
|nameIN|VARCHAR|20|||
|descriptionIN|VARCHAR|60|||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
PROCEDURE insertMaterial (IN nameIN varchar(20), IN descriptionIN varchar(60))
DETERMINISTIC
BEGIN

  DECLARE selected bigint;
  DECLARE result json;

  SELECT
    COUNT(*) INTO selected
  FROM material m
  WHERE m.name LIKE nameIN;

  IF (selected = 0) THEN
    INSERT INTO material (name, description)
      VALUES (nameIN, descriptionIN);

    SELECT
      m.id AS `key`,
      m.name AS `material`,
      m.description AS `description`,
      '[]' AS `specifications`
    FROM material m
    WHERE m.name = nameIN;

  ELSE
    SELECT
      'Already Exists!' AS `response`;
  END IF;

END
```

## <a name="#DependsOn"></a>Depends On _`2`_
- ![User](../../../../../Images/user.svg) [databaseManager@%](../../../Users/databaseManager@%.md)
- ![Table](../../../../../Images/table.svg) [material](../Tables/material.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 18/06/2024|
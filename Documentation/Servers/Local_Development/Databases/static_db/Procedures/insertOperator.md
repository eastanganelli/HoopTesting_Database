###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Procedures](Procedures.md)>insertOperator


# ![logo](../../../../../Images/procedure64.svg) insertOperator

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
|Created|11/6/2024 11:06:03|
|Last Modified|11/6/2024 11:06:03|


## <a name="#Parameters"></a>Parameters
|Name|Data Type|Length|Precision|Scale|
|---|---|---|---|---|
|dni|INT||11||
|name|VARCHAR|20|||
|familyname|VARCHAR|30|||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
PROCEDURE insertOperator (IN dni int UNSIGNED, IN name varchar(20), IN familyname varchar(30))
DETERMINISTIC
BEGIN

  DECLARE selected bigint;

  SELECT
    COUNT(*) INTO selected
  FROM operator o
  WHERE o.dni = dni;

  IF (selected = 0) THEN
    INSERT INTO operator (dni, name, familyname)
      VALUES (dni, name, familyname);

    SELECT
      o.id AS `key`,
      o.dni AS `dni`,
      o.name AS `name`,
      o.familyname AS `familyName`
    FROM operator o
    WHERE o.dni = dni;

  ELSE
    SELECT
      'Already Exists!' AS `response`;
  END IF;

END
```

## <a name="#DependsOn"></a>Depends On _`2`_
- ![User](../../../../../Images/user.svg) [databaseManager@%](../../../Users/databaseManager@%.md)
- ![Table](../../../../../Images/table.svg) [operator](../Tables/operator.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 26/06/2024|
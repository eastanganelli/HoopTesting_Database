###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Procedures](Procedures.md)>updateOperator


# ![logo](../../../../../Images/procedure64.svg) updateOperator

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
|id|INT||11||
|dni|INT||11||
|name|VARCHAR|50|||
|familyname|VARCHAR|50|||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
PROCEDURE updateOperator (IN id int UNSIGNED, IN dni int UNSIGNED, IN name varchar(50), IN familyname varchar(50))
DETERMINISTIC
BEGIN

  DECLARE result text;

  IF (existOperator(id) = TRUE) THEN
    UPDATE LOW_PRIORITY operator o
    SET o.dni = dni,
        o.name = name,
        o.familyname = familyname
    WHERE o.id = id;

    SELECT
      'Successful Updated!' INTO result;
  ELSE
    SELECT
      'Unsuccessful Updated!' INTO result;
  END IF;

  SELECT
    result AS response;

END
```

## <a name="#DependsOn"></a>Depends On _`3`_
- ![User](../../../../../Images/user.svg) [databaseManager@%](../../../Users/databaseManager@%.md)
- ![Function](../../../../../Images/function.svg) [existOperator](../Functions/existOperator.md)
- ![Table](../../../../../Images/table.svg) [operator](../Tables/operator.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 25/06/2024|
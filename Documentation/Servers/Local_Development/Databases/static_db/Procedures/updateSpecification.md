###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Procedures](Procedures.md)>updateSpecification


# ![logo](../../../../../Images/procedure64.svg) updateSpecification

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
|id|INT||11||
|nameIN|VARCHAR|20|||
|descriptionIN|VARCHAR|80|||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
PROCEDURE updateSpecification (IN id int UNSIGNED, IN nameIN varchar(20), IN descriptionIN varchar(80))
DETERMINISTIC
BEGIN

  DECLARE result text;

  IF (existSpecification(id) = TRUE) THEN
    UPDATE LOW_PRIORITY specification s
    SET s.id = id,
        s.name = nameIN,
        s.description = descriptionIN
    WHERE s.id = id;

    SELECT
      'Successful Updated!' INTO result;
  ELSE
    SELECT
      'Unsuccessful Updated!' INTO result;
  END IF;

  SELECT
    result AS `response`;
END
```

## <a name="#DependsOn"></a>Depends On _`3`_
- ![User](../../../../../Images/user.svg) [databaseManager@%](../../../Users/databaseManager@%.md)
- ![Function](../../../../../Images/function.svg) [existSpecification](../Functions/existSpecification.md)
- ![Table](../../../../../Images/table.svg) [specification](../Tables/specification.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 26/06/2024|
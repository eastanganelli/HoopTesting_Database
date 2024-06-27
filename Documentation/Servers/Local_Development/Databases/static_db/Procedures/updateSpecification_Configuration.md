###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Procedures](Procedures.md)>updateSpecification_Configuration


# ![logo](../../../../../Images/procedure64.svg) updateSpecification_Configuration

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
|timeIN|SMALLINT||6||
|timeTypeIN|VARCHAR|1|||
|temperatureIN|TINYINT||4||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
PROCEDURE updateSpecification_Configuration (IN id int UNSIGNED, IN timeIN smallint, IN timeTypeIN varchar(1), IN temperatureIN tinyint)
DETERMINISTIC
BEGIN

  DECLARE result text;

  IF (existSpecification_Configuration(id) = TRUE) THEN
    UPDATE LOW_PRIORITY specification_configuration sc
    SET sc.id = id,
        sc.time = timeIN,
        sc.timeType = timeTypeIN,
        sc.temperature = temperatureIN
    WHERE sc.id = id;

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
- ![Function](../../../../../Images/function.svg) [existSpecification_Configuration](../Functions/existSpecification_Configuration.md)
- ![Table](../../../../../Images/table.svg) [specification_configuration](../Tables/specification_configuration.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 26/06/2024|
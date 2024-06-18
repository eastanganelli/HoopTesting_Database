###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Procedures](Procedures.md)>insertSpecification_Configuration


# ![logo](../../../../../Images/procedure64.svg) insertSpecification_Configuration

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
|specificationIN|INT||11||
|timeIN|SMALLINT||6||
|timeTypeIN|VARCHAR|1|||
|temperatureIN|TINYINT||4||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
PROCEDURE insertSpecification_Configuration (IN specificationIN int UNSIGNED, IN timeIN smallint, IN timeTypeIN varchar(1), IN temperatureIN tinyint)
DETERMINISTIC
BEGIN

  DECLARE selected bigint;

  SELECT
    COUNT(*) INTO selected
  FROM specification_configuration sc
  WHERE sc.specification = specificationIN
  AND sc.time = timeIN
  AND sc.temperature = temperatureIN;

  IF (selected = 0) THEN
    INSERT INTO specification_configuration (specification, time, timeType, temperature)
      VALUES (specificationIN, timeIN, timeTypeIN, temperatureIN);

    SELECT
      sc.id AS `key`,
      sc.time AS `time`,
      sc.timeType AS `timeType`,
      sc.temperature AS `temperature`
    FROM specification_configuration sc
    WHERE sc.specification = specificationIN
    AND sc.time = timeIN
    AND sc.temperature = temperatureIN;

  ELSE
    SELECT
      'Already Exists!' AS `response`;
  END IF;

END
```

## <a name="#DependsOn"></a>Depends On _`3`_
- ![User](../../../../../Images/user.svg) [databaseManager@%](../../../Users/databaseManager@%.md)
- ![Table](../../../../../Images/table.svg) [specification_configuration](../Tables/specification_configuration.md)
- ![Table](../../../../../Images/table.svg) [specification](../Tables/specification.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 18/06/2024|
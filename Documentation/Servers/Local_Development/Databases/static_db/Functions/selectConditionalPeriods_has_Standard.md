###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Functions](Functions.md)>selectConditionalPeriods_has_Standard


# ![logo](../../../../../Images/function64.svg) selectConditionalPeriods_has_Standard

## <a name="#Description"></a>Description
> Selection of Conditional Periods of a Standard
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|SQL Access|CONTAINS SQL|
|Deterministic|True|
|Security|Definer|
|Definer|root|
|SQL Mode|NO_AUTO_VALUE_ON_ZERO|
|Language|SQL|
|Created|24/6/2024 23:05:15|
|Last Modified|24/6/2024 23:05:15|


## <a name="#Parameters"></a>Parameters
|Name|Data Type|Length|Precision|Scale|
|---|---|---|---|---|
|idStandard|INT||11||
|(Result)|JSON|0|||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
FUNCTION selectConditionalPeriods_has_Standard (idStandard int UNSIGNED)
RETURNS json
DETERMINISTIC
COMMENT 'Selection of Conditional Periods of a Standard'
BEGIN

  DECLARE result json;
  DECLARE elements tinyint(1);

  SELECT
    COUNT(*) INTO elements
  FROM conditional_period cp
  WHERE cp.standard = idStandard;

  IF (elements > 0) THEN
    WITH periodsOrder
    AS
    (SELECT
        cp.id AS `key`,
        CONCAT(CONVERT(cp.time, char), ' ', cp.timeType, ' ± ', CONVERT(cp.aproxTime, char), ' ', cp.aproxType) AS `condPeriod`,
        cp.minwall,
        cp.maxwall
      FROM conditional_period cp
      WHERE cp.standard = idStandard)

    SELECT
      JSON_ARRAYAGG(JSON_OBJECT('key', po.`key`,
      'condPeriod', po.condPeriod,
      'minwall', po.minwall,
      'maxwall', po.maxwall)) INTO result
    FROM periodsOrder po;
  ELSE
    SELECT
      '[]' INTO result;
  END IF;

  RETURN result;
END
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Table](../../../../../Images/table.svg) [conditional_period](../Tables/conditional_period.md)


## <a name="#UsedBy"></a>Used By _`1`_
- ![Procedure](../../../../../Images/procedure.svg) [selectStandardsJSON](../Procedures/selectStandardsJSON.md)


||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 26/06/2024|
###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Procedures](Procedures.md)>insertConditionalPeriod


# ![logo](../../../../../Images/procedure64.svg) insertConditionalPeriod

## <a name="#Description"></a>Description
> Insertion of new Conditional Period
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|SQL Access|CONTAINS SQL|
|Deterministic|True|
|Security|Definer|
|Definer|root|
|SQL Mode|NO_AUTO_VALUE_ON_ZERO|
|Language|SQL|
|Created|24/6/2024 22:41:34|
|Last Modified|24/6/2024 22:41:34|


## <a name="#Parameters"></a>Parameters
|Name|Data Type|Length|Precision|Scale|
|---|---|---|---|---|
|idStandard|INT||11||
|minwall|INT||11||
|maxwall|INT||11||
|time|INT||11||
|timeType|VARCHAR|3|||
|aproxTime|INT||11||
|aproxType|VARCHAR|3|||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
PROCEDURE insertConditionalPeriod (IN idStandard int UNSIGNED, IN minwall int UNSIGNED, IN maxwall int UNSIGNED, IN time int UNSIGNED, IN timeType varchar(3), IN aproxTime int UNSIGNED, IN aproxType varchar(3))
DETERMINISTIC
COMMENT 'Insertion of new Conditional Period'
BEGIN

  DECLARE elements int UNSIGNED;

  SELECT
    COUNT(*) INTO elements
  FROM conditional_period cp
  WHERE cp.standard = idStandard
  AND cp.minwall = minwall
  AND cp.maxwall = maxwall
  AND cp.time = time
  AND cp.timeType LIKE timeType
  AND cp.aproxTime = aproxTime
  AND cp.aproxType LIKE aproxType;

  IF elements = 0 THEN
    INSERT HIGH_PRIORITY INTO conditional_period (standard, time, timeType, aproxTime, aproxType, minwall, maxwall)
      VALUES (idStandard, time, timeType, aproxTime, aproxType, minwall, maxwall);

    SELECT
      cp.id AS `key`,
      CONCAT(CONVERT(cp.time, char), ' ', cp.timeType, ' ± ', CONVERT(cp.aproxTime, char), ' ', cp.aproxType) AS `condperiod`,
      cp.minwall AS `minwall`,
      cp.maxwall AS `maxwall`
    FROM conditional_period cp
    WHERE cp.standard = idStandard
    AND cp.minwall = minwall
    AND cp.maxwall = maxwall
    AND cp.time LIKE time;

  ELSE
    SELECT
      'Already Exist!' AS `response`;
  END IF;

END
```

## <a name="#DependsOn"></a>Depends On _`3`_
- ![User](../../../../../Images/user.svg) [databaseManager@%](../../../Users/databaseManager@%.md)
- ![Table](../../../../../Images/table.svg) [conditional_period](../Tables/conditional_period.md)
- ![Table](../../../../../Images/table.svg) [standard](../Tables/standard.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 26/06/2024|
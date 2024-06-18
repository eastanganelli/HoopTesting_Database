###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Procedures](Procedures.md)>insertConditionalPeriod


# ![logo](../../../../../Images/procedure64.svg) insertConditionalPeriod

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
|idStandard|INT||11||
|minwall|INT||11||
|maxwall|INT||11||
|time|VARCHAR|20|||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
PROCEDURE insertConditionalPeriod (IN idStandard int UNSIGNED, IN minwall int, IN maxwall int, IN time varchar(20))
DETERMINISTIC
BEGIN

  DECLARE elements int UNSIGNED;

  SELECT
    COUNT(*) INTO elements
  FROM conditional_period cp
  WHERE cp.standard = idStandard
  AND cp.minwall = minwall
  AND cp.maxwall = maxwall
  AND cp.time LIKE time;

  IF elements = 0 THEN
    INSERT HIGH_PRIORITY INTO conditional_period (standard, time, minwall, maxwall)
      VALUES (idStandard, time, minwall, maxwall);

    SELECT
      cp.id AS `key`,
      cp.time AS `time`,
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
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 18/06/2024|
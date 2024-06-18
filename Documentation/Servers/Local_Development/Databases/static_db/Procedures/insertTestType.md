###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Procedures](Procedures.md)>insertTestType


# ![logo](../../../../../Images/procedure64.svg) insertTestType

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
|Created|13/6/2024 01:29:06|
|Last Modified|13/6/2024 01:29:06|


## <a name="#Parameters"></a>Parameters
|Name|Data Type|Length|Precision|Scale|
|---|---|---|---|---|
|idStandard|INT||11||
|testTypeIN|VARBINARY|255|||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
PROCEDURE insertTestType (IN idStandard int UNSIGNED, IN testTypeIN varbinary(255))
DETERMINISTIC
BEGIN

  DECLARE elements int UNSIGNED;

  SELECT
    COUNT(*) INTO elements
  FROM test_type tt
  WHERE tt.standard = idStandard
  AND tt.testType = testTypeIN;

  IF elements = 0 THEN
    INSERT HIGH_PRIORITY INTO test_type (standard, testType)
      VALUES (idStandard, testTypeIN);

    SELECT
      tt.id AS `key`,
      tt.testType AS `testtype`
    FROM test_type tt
    WHERE tt.standard = idStandard
    AND tt.testType = testTypeIN;

  ELSE
    SELECT
      'Already Exist!' AS `response`;
  END IF;

END
```

## <a name="#DependsOn"></a>Depends On _`3`_
- ![User](../../../../../Images/user.svg) [databaseManager@%](../../../Users/databaseManager@%.md)
- ![Table](../../../../../Images/table.svg) [test_type](../Tables/test_type.md)
- ![Table](../../../../../Images/table.svg) [standard](../Tables/standard.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 18/06/2024|
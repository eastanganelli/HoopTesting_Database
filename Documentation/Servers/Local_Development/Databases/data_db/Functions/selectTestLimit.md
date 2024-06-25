###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[data_db](../data_db.md)>[Functions](Functions.md)>selectTestLimit


# ![logo](../../../../../Images/function64.svg) selectTestLimit

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
|Created|11/6/2024 11:05:27|
|Last Modified|11/6/2024 11:05:27|


## <a name="#Parameters"></a>Parameters
|Name|Data Type|Length|Precision|Scale|
|---|---|---|---|---|
|idSpecimen|INT||11||
|isASC|TINYINT||4||
|(Result)|DATETIME||0||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
FUNCTION selectTestLimit (idSpecimen int UNSIGNED, isASC tinyint UNSIGNED)
RETURNS datetime
DETERMINISTIC
BEGIN

  SET @Time = NULL;

  IF isASC = 0 THEN
    SELECT
      td.createdAt INTO @Time
    FROM data td
    WHERE td.specimen = idSpecimen
    ORDER BY td.createdAt ASC LIMIT 1;
  ELSE
    SELECT
      td.createdAt INTO @Time
    FROM data td
    WHERE td.specimen = idSpecimen
    ORDER BY td.createdAt DESC LIMIT 1;
  END IF;

  RETURN @Time;
END
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Table](../../../../../Images/table.svg) [data](../Tables/data.md)


## <a name="#UsedBy"></a>Used By _`2`_
- ![Function](../../../../../Images/function.svg) [selectTestSpecimen](selectTestSpecimen.md)
- ![Function](../../../../../Images/function.svg) [selectTestsSpecimens](selectTestsSpecimens.md)


||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 25/06/2024|
###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[data_db](../data_db.md)>[Functions](Functions.md)>selectTestNumber


# ![logo](../../../../../Images/function64.svg) selectTestNumber

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
|(Result)|INT||11||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
FUNCTION selectTestNumber (idSpecimen int UNSIGNED)
RETURNS int(11) UNSIGNED
DETERMINISTIC
BEGIN
  SET @testNumber = 0;

  SET @sampleID = (SELECT
      ts.sample
    FROM specimen ts
    WHERE ts.id = idSpecimen);

  SELECT
    COUNT(*) INTO @testNumber
  FROM specimen ts
  WHERE ts.id <= idSpecimen
  AND ts.sample = @sampleID
  GROUP BY ts.sample;

  RETURN @testNumber;
END
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Table](../../../../../Images/table.svg) [specimen](../Tables/specimen.md)


## <a name="#UsedBy"></a>Used By _`2`_
- ![Function](../../../../../Images/function.svg) [selectTestSpecimen](selectTestSpecimen.md)
- ![Function](../../../../../Images/function.svg) [selectTestsSpecimens](selectTestsSpecimens.md)


||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 26/06/2024|
###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[data_db](../data_db.md)>[Functions](Functions.md)>selectTestSpecimen


# ![logo](../../../../../Images/function64.svg) selectTestSpecimen

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
|(Result)|JSON|0|||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
FUNCTION selectTestSpecimen (idSpecimen int UNSIGNED)
RETURNS json
DETERMINISTIC
BEGIN

  SET @result = NULL;

  SET @countSpecimens = countSpecimens(idSpecimen);

  SET @beginTime = selectTestLimit(idSpecimen, 0);

  SET @endTime = selectTestLimit(idSpecimen, 1);

  SET @testNumber = selectTestNumber(idSpecimen);

  SELECT
    JSON_OBJECT('idSpecimen',
    se.id,
    'operator',
    se.operator,
    'enviroment',
    se.enviroment,
    'beginTime',
    DATE_FORMAT(@beginTime,
    '%d/%m/%Y %H:%i:%s'),
    'endTime',
    DATE_FORMAT(@endTime,
    '%d/%m/%Y %H:%i:%s'),
    'duration',
    DATE_FORMAT(TIMEDIFF(@endTime,
    @beginTime),
    '%H:%i:%s'),
    'counts',
    @countSpecimens,
    'testNumber',
    @testNumber,
    'testName',
    se.testName,
    'endCap',
    se.endCap,
    'fail',
    se.failText,
    'remark',
    se.remark) INTO @result
  FROM specimen se
  WHERE se.id = idSpecimen;

  RETURN @result;
END
```

## <a name="#DependsOn"></a>Depends On _`4`_
- ![Procedure](../../../../../Images/procedure.svg) [countSpecimens](../Procedures/countSpecimens.md)
- ![Function](../../../../../Images/function.svg) [selectTestLimit](selectTestLimit.md)
- ![Function](../../../../../Images/function.svg) [selectTestNumber](selectTestNumber.md)
- ![Table](../../../../../Images/table.svg) [specimen](../Tables/specimen.md)


## <a name="#UsedBy"></a>Used By _`2`_
- ![Procedure](../../../../../Images/procedure.svg) [selectCompareTests](../Procedures/selectCompareTests.md)
- ![Procedure](../../../../../Images/procedure.svg) [selectTest](../Procedures/selectTest.md)


||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 26/06/2024|
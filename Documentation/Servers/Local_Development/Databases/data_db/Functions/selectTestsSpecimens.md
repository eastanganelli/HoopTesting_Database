###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[data_db](../data_db.md)>[Functions](Functions.md)>selectTestsSpecimens


# ![logo](../../../../../Images/function64.svg) selectTestsSpecimens

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
|idSample|INT||11||
|(Result)|JSON|0|||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
FUNCTION selectTestsSpecimens (idSample int UNSIGNED)
RETURNS json
DETERMINISTIC
BEGIN
  SET @myResult = NULL;

  WITH preResults
  AS
  (SELECT
      ts.id,
      ts.operator,
      selectTestNumber(ts.id) AS testNumber,
      (selectTestLimit(ts.id, 0)) AS beginTime,
      (selectTestLimit(ts.id, 1)) AS endTime
    FROM specimen ts
    WHERE ts.sample = idSample)

  (SELECT
      JSON_ARRAYAGG(JSON_OBJECT('idSpecimen', pr.id,
      'operator', pr.operator, 'testNumber', pr.testNumber, 'beginTime', DATE_FORMAT(pr.beginTime, '%d/%m/%Y %H:%i:%s'), 'endTime', DATE_FORMAT(pr.endTime, '%d/%m/%Y %H:%i:%s'), 'duration', DATE_FORMAT(TIMEDIFF(pr.endTime, pr.beginTime), '%H:%i:%s'))) INTO @myResult
    FROM preResults pr
    ORDER BY pr.id DESC);

  RETURN @myResult;
END
```

## <a name="#DependsOn"></a>Depends On _`3`_
- ![Function](../../../../../Images/function.svg) [selectTestNumber](selectTestNumber.md)
- ![Function](../../../../../Images/function.svg) [selectTestLimit](selectTestLimit.md)
- ![Table](../../../../../Images/table.svg) [specimen](../Tables/specimen.md)


## <a name="#UsedBy"></a>Used By _`1`_
- ![Procedure](../../../../../Images/procedure.svg) [selectTests](../Procedures/selectTests.md)


||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 18/06/2024|
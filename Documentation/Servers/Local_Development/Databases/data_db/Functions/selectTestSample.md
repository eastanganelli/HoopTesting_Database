###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[data_db](../data_db.md)>[Functions](Functions.md)>selectTestSample


# ![logo](../../../../../Images/function64.svg) selectTestSample

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
FUNCTION selectTestSample (idSample int UNSIGNED)
RETURNS json
DETERMINISTIC
BEGIN

  SET @result = NULL;

  SELECT
    JSON_OBJECT('idSample',
    sa.id,
    'standard',
    sa.standard,
    'material',
    sa.material,
    'specification',
    sa.specification,
    'diameterReal',
    sa.diamreal,
    'diameterNominal',
    sa.diamnom,
    'wallThickness',
    sa.wallthick,
    'lengthTotal',
    sa.lentotal,
    'lengthFree',
    sa.lenfree,
    'targetTemperature',
    sa.targettemp,
    'targetPressure',
    sa.targetpressure,
    'hoopStress',
    ((sa.targettemp * (sa.diamreal - sa.wallthick)) / (10 * 2 * sa.wallthick)),
    'conditionalPeriod',
    sa.condPeriod) INTO @result
  FROM sample sa
  WHERE sa.id = idSample;

  RETURN @result;
END
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Table](../../../../../Images/table.svg) [sample](../Tables/sample.md)


## <a name="#UsedBy"></a>Used By _`2`_
- ![Procedure](../../../../../Images/procedure.svg) [selectCompareTests](../Procedures/selectCompareTests.md)
- ![Procedure](../../../../../Images/procedure.svg) [selectTest](../Procedures/selectTest.md)


||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 18/06/2024|
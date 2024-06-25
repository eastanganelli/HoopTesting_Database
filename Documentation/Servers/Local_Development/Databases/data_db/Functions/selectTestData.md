###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[data_db](../data_db.md)>[Functions](Functions.md)>selectTestData


# ![logo](../../../../../Images/function64.svg) selectTestData

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
FUNCTION selectTestData (idSpecimen int UNSIGNED)
RETURNS json
DETERMINISTIC
BEGIN

  SET @returnData = NULL;

  SET @initTime = (SELECT
      td.createdAt
    FROM data td
    WHERE td.specimen = idSpecimen
    ORDER BY td.createdAt ASC LIMIT 1);

  WITH groupingData
  AS
  (SELECT
      td.createdAt,
      AVG(td.pressure) AS 'pressure',
      AVG(td.temperature) AS 'temperature'
    FROM data td
    WHERE td.specimen = idSpecimen
    GROUP BY td.createdAt)

  SELECT
    JSON_ARRAYAGG(JSON_OBJECT('key',
    TIMESTAMPDIFF(SECOND, @initTime, gd.createdAt),
    'pressure',
    gd.pressure,
    'temperature',
    gd.temperature)) INTO @returnData
  FROM groupingData gd;

  RETURN @returnData;
END
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Table](../../../../../Images/table.svg) [data](../Tables/data.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 25/06/2024|
###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[data_db](../data_db.md)>[Procedures](Procedures.md)>selectTestData


# ![logo](../../../../../Images/procedure64.svg) selectTestData

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

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
PROCEDURE selectTestData (IN idSpecimen int UNSIGNED)
DETERMINISTIC
BEGIN

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
    TIMESTAMPDIFF(SECOND, @initTime, gd.createdAt) AS 'key',
    gd.pressure AS 'pressure',
    gd.temperature AS 'temperature'
  FROM groupingData gd;

END
```

## <a name="#DependsOn"></a>Depends On _`2`_
- ![User](../../../../../Images/user.svg) [reportGenerator@%](../../../Users/reportGenerator@%.md)
- ![Table](../../../../../Images/table.svg) [data](../Tables/data.md)


## <a name="#UsedBy"></a>Used By _`1`_
- ![Procedure](../../../../../Images/procedure.svg) [selectCompareTests](selectCompareTests.md)


||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 25/06/2024|
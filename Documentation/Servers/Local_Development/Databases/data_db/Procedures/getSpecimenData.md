###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[data_db](../data_db.md)>[Procedures](Procedures.md)>getSpecimenData


# ![logo](../../../../../Images/procedure64.svg) getSpecimenData

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
|mySpecimenID|INT||11||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
PROCEDURE getSpecimenData (IN mySpecimenID int UNSIGNED)
DETERMINISTIC
BEGIN

  CREATE TEMPORARY TABLE IF NOT EXISTS myResult AS (SELECT
      td.id,
      td.pressure,
      td.temperature,
      # td.createdAt,
      (TIMESTAMPDIFF(MICROSECOND, (SELECT
          td2.createdAt
        FROM data td2
        WHERE td2.specimen = mySpecimenID LIMIT 1), td.createdAt)) AS `difference`
    FROM data td
    WHERE td.specimen = mySpecimenID);

  SELECT
    ts.id AS `idTest`,
    (SELECT
        JSON_ARRAYAGG(JSON_OBJECT('id', r.id, 'pressure', r.pressure, 'temperature', r.temperature, 'timekey', r.difference))
      FROM myResult r) AS `testData`
  FROM specimen ts
    INNER JOIN sample ts1
      ON ts.sample = ts1.id
  WHERE ts.id = mySpecimenID;

  DROP TEMPORARY TABLE IF EXISTS myResult;

END
```

## <a name="#DependsOn"></a>Depends On _`3`_
- ![Table](../../../../../Images/table.svg) [data](../Tables/data.md)
- ![Table](../../../../../Images/table.svg) [specimen](../Tables/specimen.md)
- ![Table](../../../../../Images/table.svg) [sample](../Tables/sample.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 25/06/2024|
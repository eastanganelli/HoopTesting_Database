###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[data_db](../data_db.md)>[Procedures](Procedures.md)>selectCompareTests


# ![logo](../../../../../Images/procedure64.svg) selectCompareTests

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
|arraySpecimens|TEXT||||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
PROCEDURE selectCompareTests (IN arraySpecimens text)
DETERMINISTIC
BEGIN

  SELECT
    (selectTestSample(sa.id)) AS 'mySample',
    (selectTestSpecimen(se.id)) AS 'mySpecimen',
    (selectTestData(se.id)) AS 'myData'
  FROM specimen se
    INNER JOIN sample sa
      ON se.sample = sa.id
  WHERE FIND_IN_SET(se.id, arraySpecimens) > 0;

END
```

## <a name="#DependsOn"></a>Depends On _`5`_
- ![Function](../../../../../Images/function.svg) [selectTestSample](../Functions/selectTestSample.md)
- ![Function](../../../../../Images/function.svg) [selectTestSpecimen](../Functions/selectTestSpecimen.md)
- ![Procedure](../../../../../Images/procedure.svg) [selectTestData](selectTestData.md)
- ![Table](../../../../../Images/table.svg) [specimen](../Tables/specimen.md)
- ![Table](../../../../../Images/table.svg) [sample](../Tables/sample.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 18/06/2024|
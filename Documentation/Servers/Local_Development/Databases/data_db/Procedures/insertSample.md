###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[data_db](../data_db.md)>[Procedures](Procedures.md)>insertSample


# ![logo](../../../../../Images/procedure64.svg) insertSample

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
|standard|VARCHAR|25|||
|material|VARCHAR|10|||
|specification|VARCHAR|6|||
|diamnom|INT||11||
|diamreal|INT||11||
|wallthick|INT||11||
|lenfree|INT||11||
|lentotal|INT||11||
|targetpressure|INT||11||
|targettemp|INT||11||
|condPeriod|VARCHAR|15|||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE
DEFINER = 'root'
PROCEDURE insertSample (IN standard varchar(25), IN material varchar(10), IN specification varchar(6), IN diamnom int UNSIGNED, IN diamreal int UNSIGNED, IN wallthick int UNSIGNED, IN lenfree int UNSIGNED, IN lentotal int UNSIGNED, IN targetpressure int, IN targettemp int, IN condPeriod varchar(15))
DETERMINISTIC
BEGIN

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN

    GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, @message = MESSAGE_TEXT;
    SELECT
      @message AS `idSample`;

  END;

  INSERT INTO sample (standard, condPeriod, material, specification, targettemp, targetpressure, diamreal, diamnom, wallthick, lenfree, lentotal)
    VALUES (standard, condPeriod, material, specification, targettemp, targetpressure, diamreal, diamnom, wallthick, lenfree, lentotal);

  SELECT
    ts.id AS `idSample`
  FROM sample ts
  ORDER BY ts.id DESC
  LIMIT 1;

END
```

## <a name="#DependsOn"></a>Depends On _`2`_
- ![User](../../../../../Images/user.svg) [dataCollector@%](../../../Users/dataCollector@%.md)
- ![Table](../../../../../Images/table.svg) [sample](../Tables/sample.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 26/06/2024|
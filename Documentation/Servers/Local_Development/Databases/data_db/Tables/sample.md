###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[data_db](../data_db.md)>[Tables](Tables.md)>sample


# ![logo](../../../../../Images/table64.svg) sample

## <a name="#Description"></a>Description
> Test Sample information
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Engine|InnoDB|
|Auto Increment|50|
|Average Row Length|16384|
|Charset|utf8mb4|
|Collation|utf8mb4_general_ci|
|Row Format|Dynamic|
|Min Rows|0|
|Max Rows|0|
|Checksum|False|
|Page Checksum|True|
|Pack Keys|False|
|Delay Key Write|False|
|Is Partitioned|False|
|Encryption|False|
|Persistent Statistics|DEFAULT|
|Auto Recalculate Statistics|DEFAULT|
|Sample Pages|0|
|Created|11/6/2024 11:05:27|
|Last Modified|1/1/0001 00:00:00|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Unsigned|Zerofill|Binary|Not Null|Auto Increment|Default|Virtual|Invisible|Description|
|:---:|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)[![Indexes ](../../../../../Images/index.svg)](#Indexes)|id|INT||11||True|False|False|True|True||False|False||
||standard|VARCHAR|25|||False|False|False|True|False||False|False||
||material|VARCHAR|10|||False|False|False|True|False||False|False||
||specification|VARCHAR|10|||False|False|False|True|False||False|False||
||diamreal|INT||11||True|False|False|True|False||False|False||
||diamnom|INT||11||True|False|False|True|False||False|False||
||wallthick|INT||11||True|False|False|True|False||False|False||
||lentotal|INT||11||True|False|False|True|False||False|False||
||lenfree|INT||11||True|False|False|True|False||False|False||
||targettemp|INT||11||False|False|False|True|False||False|False||
||targetpressure|INT||11||False|False|False|True|False||False|False||
||condPeriod|VARCHAR|15|||False|False|False|True|False||False|False||
||createdAt|DATETIME||0||False|False|False|True|False|CURRENT_TIMESTAMP|False|False||
||updatedAt|DATETIME||0||False|False|False|True|False|CURRENT_TIMESTAMP|False|False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)||id|True|None|0|

## <a name="#Triggers"></a>Triggers
|Name|Type|Event|Security|Definer|
|---|---|---|---|---|
|NewSample|BEFORE|INSERT|Definer|root|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE sample (
  id int UNSIGNED NOT NULL AUTO_INCREMENT,
  standard varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  material varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  specification varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  diamreal int UNSIGNED NOT NULL,
  diamnom int UNSIGNED NOT NULL,
  wallthick int UNSIGNED NOT NULL,
  lentotal int UNSIGNED NOT NULL,
  lenfree int UNSIGNED NOT NULL,
  targettemp int NOT NULL,
  targetpressure int NOT NULL,
  condPeriod varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  createdAt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatedAt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci,
COMMENT = 'Test Sample information';
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By _`12`_
- ![Procedure](../../../../../Images/procedure.svg) [insertSample](../Procedures/insertSample.md)
- ![Procedure](../../../../../Images/procedure.svg) [insertSpecimen](../Procedures/insertSpecimen.md)
- ![Procedure](../../../../../Images/procedure.svg) [selectSample](../Procedures/selectSample.md)
- ![Procedure](../../../../../Images/procedure.svg) [selectSampleID](../Procedures/selectSampleID.md)
- ![Procedure](../../../../../Images/procedure.svg) [selectCompareTests](../Procedures/selectCompareTests.md)
- ![Procedure](../../../../../Images/procedure.svg) [selectTest](../Procedures/selectTest.md)
- ![Procedure](../../../../../Images/procedure.svg) [selectTests](../Procedures/selectTests.md)
- ![Trigger](../../../../../Images/trigger.svg) [NewSample](../Triggers/NewSample.md)
- ![Table](../../../../../Images/table.svg) [specimen](specimen.md)
- ![Procedure](../../../../../Images/procedure.svg) [getSpecimenData](../Procedures/getSpecimenData.md)
- ![Function](../../../../../Images/function.svg) [selectTestSample](../Functions/selectTestSample.md)
- ![Trigger](../../../../../Images/trigger.svg) [DeleteTestSample](../Triggers/DeleteTestSample.md)


||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 25/06/2024|
###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[data_db](../data_db.md)>[Tables](Tables.md)>specimen


# ![logo](../../../../../Images/table64.svg) specimen

## <a name="#Description"></a>Description
> Test specimen
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Engine|InnoDB|
|Auto Increment|136|
|Average Row Length|910|
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
|[![Foreign Keys FK_test_specimen_test_sample_id: sample](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes FK_test_specimen_test_sample_id](../../../../../Images/index.svg)](#Indexes)|sample|INT||11||True|False|False|True|False||False|False||
||operator|VARCHAR|40|||False|False|False|True|False|'STEL S.A.'|False|False||
||enviroment|VARCHAR|20|||False|False|False|False|False|''|False|False||
||testName|VARCHAR|120|||False|False|False|False|False|''|False|False||
||endCap|VARCHAR|10|||False|False|False|False|False|''|False|False||
||failText|VARCHAR|200|||False|False|False|True|False|'Sin Fallas'|False|False||
||remark|VARCHAR|200|||False|False|False|True|False|'Sin Observaciones'|False|False||
||createdAt|DATETIME||0||False|False|False|True|False|CURRENT_TIMESTAMP|False|False||
||updatedAt|DATETIME||0||False|False|False|True|False|CURRENT_TIMESTAMP|False|False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)||id|True|None|0|
||FK_test_specimen_test_sample_id|sample|False|None|0|

## <a name="#Triggers"></a>Triggers
|Name|Type|Event|Security|Definer|
|---|---|---|---|---|
|DeleteTest|BEFORE|DELETE|Definer|root|
|DeleteTestSample|AFTER|DELETE|Definer|root|

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Delete Rule|Update Rule|
|---|---|---|---|
|FK_test_specimen_test_sample_id|id|N/S|N/S|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE specimen (
  id int UNSIGNED NOT NULL AUTO_INCREMENT,
  sample int UNSIGNED NOT NULL,
  operator varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'STEL S.A.',
  enviroment varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  testName varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  endCap varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  failText varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Sin Fallas',
  remark varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Sin Observaciones',
  createdAt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatedAt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 910,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci,
COMMENT = 'Test specimen';

ALTER TABLE specimen
ADD CONSTRAINT FK_test_specimen_test_sample_id FOREIGN KEY (sample)
REFERENCES sample (id);
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Table](../../../../../Images/table.svg) [sample](sample.md)


## <a name="#UsedBy"></a>Used By _`17`_
- ![Procedure](../../../../../Images/procedure.svg) [countSpecimens](../Procedures/countSpecimens.md)
- ![Procedure](../../../../../Images/procedure.svg) [getSpecimenData](../Procedures/getSpecimenData.md)
- ![Procedure](../../../../../Images/procedure.svg) [insertData](../Procedures/insertData.md)
- ![Procedure](../../../../../Images/procedure.svg) [insertSpecimen](../Procedures/insertSpecimen.md)
- ![Table](../../../../../Images/table.svg) [data](data.md)
- ![Trigger](../../../../../Images/trigger.svg) [DeleteTest](../Triggers/DeleteTest.md)
- ![Trigger](../../../../../Images/trigger.svg) [DeleteTestSample](../Triggers/DeleteTestSample.md)
- ![Procedure](../../../../../Images/procedure.svg) [deleteTest](../Procedures/deleteTest.md)
- ![Procedure](../../../../../Images/procedure.svg) [selectCompareTests](../Procedures/selectCompareTests.md)
- ![Procedure](../../../../../Images/procedure.svg) [selectSpecimen](../Procedures/selectSpecimen.md)
- ![Procedure](../../../../../Images/procedure.svg) [selectTest](../Procedures/selectTest.md)
- ![Procedure](../../../../../Images/procedure.svg) [updateSpecimen](../Procedures/updateSpecimen.md)
- ![Function](../../../../../Images/function.svg) [countSpecimens](../Functions/countSpecimens.md)
- ![Function](../../../../../Images/function.svg) [selectTestNumber](../Functions/selectTestNumber.md)
- ![Function](../../../../../Images/function.svg) [selectTestSpecimen](../Functions/selectTestSpecimen.md)
- ![Function](../../../../../Images/function.svg) [selectTestsSpecimens](../Functions/selectTestsSpecimens.md)
- ![Function](../../../../../Images/function.svg) [specimenExists](../Functions/specimenExists.md)


||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 18/06/2024|
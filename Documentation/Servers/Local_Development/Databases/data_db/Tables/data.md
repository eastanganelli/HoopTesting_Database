###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[data_db](../data_db.md)>[Tables](Tables.md)>data


# ![logo](../../../../../Images/table64.svg) data

## <a name="#Description"></a>Description
> Data Recollected from PLC
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Engine|InnoDB|
|Auto Increment|3887|
|Average Row Length|58|
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
|[![Foreign Keys FK_test_data_test_specimen_id: specimen](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes IDX_test_data_test_specimen](../../../../../Images/index.svg)](#Indexes)|specimen|INT||11||True|False|False|True|False||False|False||
||pressure|DOUBLE|0|||False|False|False|True|False||False|False||
||temperature|DOUBLE|0|||False|False|False|True|False||False|False||
||createdAt|DATETIME||4||False|False|False|False|False|CURRENT_TIMESTAMP(4)|False|False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)||id|True|None|0|
||IDX_test_data_test_specimen|specimen|False|None|0|

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Delete Rule|Update Rule|
|---|---|---|---|
|FK_test_data_test_specimen_id|id|N/S|N/S|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE data (
  id int UNSIGNED NOT NULL AUTO_INCREMENT,
  specimen int UNSIGNED NOT NULL,
  pressure double NOT NULL,
  temperature double NOT NULL,
  createdAt datetime(4) DEFAULT CURRENT_TIMESTAMP(4),
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 58,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci,
COMMENT = 'Data Recollected from PLC';

ALTER TABLE data
ADD INDEX IDX_test_data_test_specimen (specimen);

ALTER TABLE data
ADD CONSTRAINT FK_test_data_test_specimen_id FOREIGN KEY (specimen)
REFERENCES specimen (id);
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Table](../../../../../Images/table.svg) [specimen](specimen.md)


## <a name="#UsedBy"></a>Used By _`6`_
- ![Procedure](../../../../../Images/procedure.svg) [insertData](../Procedures/insertData.md)
- ![Trigger](../../../../../Images/trigger.svg) [DeleteTest](../Triggers/DeleteTest.md)
- ![Procedure](../../../../../Images/procedure.svg) [selectTestData](../Procedures/selectTestData.md)
- ![Procedure](../../../../../Images/procedure.svg) [getSpecimenData](../Procedures/getSpecimenData.md)
- ![Function](../../../../../Images/function.svg) [selectTestData](../Functions/selectTestData.md)
- ![Function](../../../../../Images/function.svg) [selectTestLimit](../Functions/selectTestLimit.md)


||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 26/06/2024|
###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Tables](Tables.md)>test_type


# ![logo](../../../../../Images/table64.svg) test_type

## <a name="#Description"></a>Description
> 
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Engine|InnoDB|
|Auto Increment|0|
|Average Row Length|0|
|Charset|utf8mb4|
|Collation|utf8mb4_0900_ai_ci|
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
|Created|11/6/2024 11:06:02|
|Last Modified|24/6/2024 23:38:54|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Unsigned|Zerofill|Binary|Not Null|Auto Increment|Default|Virtual|Invisible|Description|
|:---:|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)[![Indexes ](../../../../../Images/index.svg)](#Indexes)|id|INT||11||True|False|False|True|True||False|False||
|[![Foreign Keys FK_test_type_standard_id: standard](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes FK_test_type_standard_id](../../../../../Images/index.svg)](#Indexes)|standard|INT||11||True|False|False|True|False||False|False||
||testType|VARCHAR|150|||False|False|False|True|False||False|False||
||createdAt|DATETIME||0||False|False|False|True|False|CURRENT_TIMESTAMP|False|False||
||updatedAt|DATETIME||0||False|False|False|True|False|CURRENT_TIMESTAMP|False|False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)||id|True|None|0|
||FK_test_type_standard_id|standard|False|None|0|

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Delete Rule|Update Rule|
|---|---|---|---|
|FK_test_type_standard_id|id|N/S|N/S|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE test_type (
  id int UNSIGNED NOT NULL AUTO_INCREMENT,
  standard int UNSIGNED NOT NULL,
  testType varchar(150) NOT NULL,
  createdAt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatedAt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

ALTER TABLE test_type
ADD CONSTRAINT FK_test_type_standard_id FOREIGN KEY (standard)
REFERENCES standard (id) ON DELETE CASCADE ON UPDATE CASCADE;
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Table](../../../../../Images/table.svg) [standard](standard.md)


## <a name="#UsedBy"></a>Used By _`6`_
- ![Procedure](../../../../../Images/procedure.svg) [selectTestType](../Procedures/selectTestType.md)
- ![Procedure](../../../../../Images/procedure.svg) [deleteTestType](../Procedures/deleteTestType.md)
- ![Procedure](../../../../../Images/procedure.svg) [insertTestType](../Procedures/insertTestType.md)
- ![Function](../../../../../Images/function.svg) [existTest_Type](../Functions/existTest_Type.md)
- ![Function](../../../../../Images/function.svg) [selectTest_Type](../Functions/selectTest_Type.md)
- ![Trigger](../../../../../Images/trigger.svg) [deleteStandardChilds](../Triggers/deleteStandardChilds.md)


||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 25/06/2024|
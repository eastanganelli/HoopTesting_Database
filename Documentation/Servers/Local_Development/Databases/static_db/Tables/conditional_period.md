###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Tables](Tables.md)>conditional_period


# ![logo](../../../../../Images/table64.svg) conditional_period

## <a name="#Description"></a>Description
> Conditional Period related to Standard
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Engine|InnoDB|
|Auto Increment|6|
|Average Row Length|3276|
|Charset|utf8mb4|
|Collation|utf8mb4_unicode_ci|
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
|Last Modified|1/1/0001 00:00:00|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Unsigned|Zerofill|Binary|Not Null|Auto Increment|Default|Virtual|Invisible|Description|
|:---:|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)[![Indexes ](../../../../../Images/index.svg)](#Indexes)|id|INT||11||True|False|False|True|True||False|False||
|[![Foreign Keys FK_conditional_period_standard_id: standard](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes FK_conditional_period_standard_id](../../../../../Images/index.svg)](#Indexes)|standard|INT||11||True|False|False|True|False||False|False||
||time|VARCHAR|20|||False|False|False|True|False||False|False||
||minwall|INT||11||True|False|False|True|False||False|False||
||maxwall|INT||11||True|False|False|True|False||False|False||
||createdAt|DATETIME||0||False|False|False|True|False|CURRENT_TIMESTAMP|False|False||
||updatedtAt|DATETIME||0||False|False|False|True|False|CURRENT_TIMESTAMP|False|False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)||id|True|None|0|
||FK_conditional_period_standard_id|standard|False|None|0|

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Delete Rule|Update Rule|
|---|---|---|---|
|FK_conditional_period_standard_id|id|N/S|N/S|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE conditional_period (
  id int UNSIGNED NOT NULL AUTO_INCREMENT,
  standard int UNSIGNED NOT NULL,
  time varchar(20) NOT NULL,
  minwall int UNSIGNED NOT NULL,
  maxwall int UNSIGNED NOT NULL,
  createdAt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatedtAt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci,
COMMENT = 'Conditional Period related to Standard';

ALTER TABLE conditional_period
ADD CONSTRAINT FK_conditional_period_standard_id FOREIGN KEY (standard)
REFERENCES standard (id);
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Table](../../../../../Images/table.svg) [standard](standard.md)


## <a name="#UsedBy"></a>Used By _`7`_
- ![Procedure](../../../../../Images/procedure.svg) [selectConditionalPeriods](../Procedures/selectConditionalPeriods.md)
- ![Procedure](../../../../../Images/procedure.svg) [selectStandarsComplete](../Procedures/selectStandarsComplete.md)
- ![Procedure](../../../../../Images/procedure.svg) [deleteConditionalPeriod](../Procedures/deleteConditionalPeriod.md)
- ![Procedure](../../../../../Images/procedure.svg) [insertConditionalPeriod](../Procedures/insertConditionalPeriod.md)
- ![Function](../../../../../Images/function.svg) [existConditionalPeriod](../Functions/existConditionalPeriod.md)
- ![Function](../../../../../Images/function.svg) [selectConditionalPeriods_has_Standard](../Functions/selectConditionalPeriods_has_Standard.md)
- ![Trigger](../../../../../Images/trigger.svg) [deleteStandardChilds](../Triggers/deleteStandardChilds.md)


||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 18/06/2024|
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
|Auto Increment|0|
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
|Created|24/6/2024 22:36:05|
|Last Modified|24/6/2024 23:37:02|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Unsigned|Zerofill|Binary|Not Null|Auto Increment|Default|Virtual|Invisible|Description|
|:---:|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)[![Indexes ](../../../../../Images/index.svg)](#Indexes)|id|INT||11||True|False|False|True|True||False|False||
|[![Foreign Keys FK_conditional_period_standard_id: standard](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes FK_conditional_period_standard_id](../../../../../Images/index.svg)](#Indexes)|standard|INT||11||True|False|False|True|False||False|False||
||time|INT||11||True|False|False|True|False|'0'|False|False||
||timeType|VARCHAR|3|||False|False|False|True|False|'h'|False|False||
||aproxTime|INT||11||True|False|False|True|False|'0'|False|False||
||aproxType|VARCHAR|3|||False|False|False|True|False|'min'|False|False||
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
  time int UNSIGNED NOT NULL DEFAULT 0,
  timeType varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'h',
  aproxTime int UNSIGNED NOT NULL DEFAULT 0,
  aproxType varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'min',
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
- ![Procedure](../../../../../Images/procedure.svg) [deleteConditionalPeriod](../Procedures/deleteConditionalPeriod.md)
- ![Procedure](../../../../../Images/procedure.svg) [insertConditionalPeriod](../Procedures/insertConditionalPeriod.md)
- ![Procedure](../../../../../Images/procedure.svg) [selectStandarsComplete](../Procedures/selectStandarsComplete.md)
- ![Function](../../../../../Images/function.svg) [existConditionalPeriod](../Functions/existConditionalPeriod.md)
- ![Function](../../../../../Images/function.svg) [selectConditionalPeriods_has_Standard](../Functions/selectConditionalPeriods_has_Standard.md)
- ![Trigger](../../../../../Images/trigger.svg) [deleteStandardChilds](../Triggers/deleteStandardChilds.md)


||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 25/06/2024|
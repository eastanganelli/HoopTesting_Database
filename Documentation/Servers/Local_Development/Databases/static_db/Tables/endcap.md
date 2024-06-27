###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Tables](Tables.md)>endcap


# ![logo](../../../../../Images/table64.svg) endcap

## <a name="#Description"></a>Description
> End Cap related to a Standard
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Engine|InnoDB|
|Auto Increment|0|
|Average Row Length|5461|
|Charset|latin1|
|Collation|latin1_swedish_ci|
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
|Created|26/6/2024 20:21:13|
|Last Modified|1/1/0001 00:00:00|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Unsigned|Zerofill|Binary|Not Null|Auto Increment|Default|Virtual|Invisible|Description|
|:---:|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)[![Indexes ](../../../../../Images/index.svg)](#Indexes)|id|INT||11||True|False|False|True|True||False|False||
|[![Foreign Keys FK_endcap_standard_id: standard](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes FK_endcap_standard_id](../../../../../Images/index.svg)](#Indexes)|standard|INT||11||True|False|False|True|False||False|False||
||name|VARCHAR|15|||False|False|False|True|False||False|False||
||createdAt|DATETIME||0||False|False|False|True|False|CURRENT_TIMESTAMP|False|False||
||updatedAt|DATETIME||0||False|False|False|True|False|CURRENT_TIMESTAMP|False|False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)||id|True|None|0|
||FK_endcap_standard_id|standard|False|None|0|

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Delete Rule|Update Rule|
|---|---|---|---|
|FK_endcap_standard_id|id|N/S|N/S|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE endcap (
  id int UNSIGNED NOT NULL AUTO_INCREMENT,
  standard int UNSIGNED NOT NULL,
  name varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  createdAt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatedAt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 5461,
CHARACTER SET latin1,
COLLATE latin1_swedish_ci,
COMMENT = 'End Cap related to a Standard';

ALTER TABLE endcap
ADD CONSTRAINT FK_endcap_standard_id FOREIGN KEY (standard)
REFERENCES standard (id) ON DELETE CASCADE ON UPDATE CASCADE;
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Table](../../../../../Images/table.svg) [standard](standard.md)


## <a name="#UsedBy"></a>Used By _`7`_
- ![Procedure](../../../../../Images/procedure.svg) [selectEndCaps](../Procedures/selectEndCaps.md)
- ![Procedure](../../../../../Images/procedure.svg) [deleteEndCap](../Procedures/deleteEndCap.md)
- ![Procedure](../../../../../Images/procedure.svg) [insertEndCap](../Procedures/insertEndCap.md)
- ![Procedure](../../../../../Images/procedure.svg) [selectStandarsComplete](../Procedures/selectStandarsComplete.md)
- ![Function](../../../../../Images/function.svg) [existEndCap](../Functions/existEndCap.md)
- ![Function](../../../../../Images/function.svg) [selectEndCaps_has_Standard](../Functions/selectEndCaps_has_Standard.md)
- ![Trigger](../../../../../Images/trigger.svg) [deleteStandardChilds](../Triggers/deleteStandardChilds.md)


||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 26/06/2024|
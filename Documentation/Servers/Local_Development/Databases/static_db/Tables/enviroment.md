###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Tables](Tables.md)>enviroment


# ![logo](../../../../../Images/table64.svg) enviroment

## <a name="#Description"></a>Description
> Enviroments
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Engine|InnoDB|
|Auto Increment|8|
|Average Row Length|4096|
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
|Created|11/6/2024 11:06:02|
|Last Modified|1/1/0001 00:00:00|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Unsigned|Zerofill|Binary|Not Null|Auto Increment|Default|Virtual|Invisible|Description|
|:---:|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)[![Indexes ](../../../../../Images/index.svg)](#Indexes)|id|INT||11||True|False|False|True|True||False|False||
|[![Foreign Keys FK_enviroment_standard_id: standard](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes FK_enviroment_standard_id](../../../../../Images/index.svg)](#Indexes)|standard|INT||11||True|False|False|True|False||False|False||
||inside|VARCHAR|30|||False|False|False|True|False||False|False||
||outside|VARCHAR|30|||False|False|False|True|False||False|False||
||createdAt|DATETIME||0||False|False|False|True|False|CURRENT_TIMESTAMP|False|False||
||updatedAt|DATETIME||0||False|False|False|True|False|CURRENT_TIMESTAMP|False|False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)||id|True|None|0|
||FK_enviroment_standard_id|standard|False|None|0|

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Delete Rule|Update Rule|
|---|---|---|---|
|FK_enviroment_standard_id|id|N/S|N/S|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE enviroment (
  id int UNSIGNED NOT NULL AUTO_INCREMENT,
  standard int UNSIGNED NOT NULL,
  inside varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  outside varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  createdAt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatedAt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 4096,
CHARACTER SET latin1,
COLLATE latin1_swedish_ci,
COMMENT = 'Enviroments';

ALTER TABLE enviroment
ADD CONSTRAINT FK_enviroment_standard_id FOREIGN KEY (standard)
REFERENCES standard (id) ON DELETE CASCADE ON UPDATE CASCADE;
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Table](../../../../../Images/table.svg) [standard](standard.md)


## <a name="#UsedBy"></a>Used By _`7`_
- ![Procedure](../../../../../Images/procedure.svg) [selectEnviroment](../Procedures/selectEnviroment.md)
- ![Procedure](../../../../../Images/procedure.svg) [selectStandarsComplete](../Procedures/selectStandarsComplete.md)
- ![Procedure](../../../../../Images/procedure.svg) [deleteEnviroment](../Procedures/deleteEnviroment.md)
- ![Procedure](../../../../../Images/procedure.svg) [insertEnviroment](../Procedures/insertEnviroment.md)
- ![Function](../../../../../Images/function.svg) [existEnviroment](../Functions/existEnviroment.md)
- ![Function](../../../../../Images/function.svg) [selectEnviroments_has_Standard](../Functions/selectEnviroments_has_Standard.md)
- ![Trigger](../../../../../Images/trigger.svg) [deleteStandardChilds](../Triggers/deleteStandardChilds.md)


||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 18/06/2024|
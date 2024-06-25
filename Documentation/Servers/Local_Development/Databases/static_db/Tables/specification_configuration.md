###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Tables](Tables.md)>specification_configuration


# ![logo](../../../../../Images/table64.svg) specification_configuration

## <a name="#Description"></a>Description
> Conditional period by Specification
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Engine|InnoDB|
|Auto Increment|0|
|Average Row Length|8192|
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
|Created|11/6/2024 11:06:02|
|Last Modified|1/1/0001 00:00:00|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Unsigned|Zerofill|Binary|Not Null|Auto Increment|Default|Virtual|Invisible|Description|
|:---:|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)[![Indexes ](../../../../../Images/index.svg)](#Indexes)|id|INT||11||True|False|False|True|True||False|False||
|[![Foreign Keys FK_specification_configuration_specification_id: specification](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes FK_period_by_material_material_id](../../../../../Images/index.svg)](#Indexes)|specification|INT||11||True|False|False|True|False||False|False||
||time|SMALLINT||6||True|False|False|True|False||False|False||
||timeType|VARCHAR|1|||False|False|False|True|False|'H'|False|False||
||temperature|TINYINT||4||True|False|False|True|False||False|False||
||createdAt|DATETIME||0||False|False|False|True|False|CURRENT_TIMESTAMP|False|False||
||updatedAt|DATETIME||0||False|False|False|True|False|CURRENT_TIMESTAMP|False|False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)||id|True|None|0|
||FK_period_by_material_material_id|specification|False|None|0|

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Delete Rule|Update Rule|
|---|---|---|---|
|FK_specification_configuration_specification_id|id|N/S|N/S|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE specification_configuration (
  id int UNSIGNED NOT NULL AUTO_INCREMENT,
  specification int UNSIGNED NOT NULL,
  time smallint UNSIGNED NOT NULL,
  timeType varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'H',
  temperature tinyint UNSIGNED NOT NULL,
  createdAt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatedAt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci,
COMMENT = 'Conditional period by Specification';

ALTER TABLE specification_configuration
ADD INDEX FK_period_by_material_material_id (specification);

ALTER TABLE specification_configuration
ADD CONSTRAINT FK_specification_configuration_specification_id FOREIGN KEY (specification)
REFERENCES specification (id) ON UPDATE CASCADE;
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Table](../../../../../Images/table.svg) [specification](specification.md)


## <a name="#UsedBy"></a>Used By _`7`_
- ![Procedure](../../../../../Images/procedure.svg) [selectSettingsSpecification](../Procedures/selectSettingsSpecification.md)
- ![Procedure](../../../../../Images/procedure.svg) [deleteSpecification_Configuration](../Procedures/deleteSpecification_Configuration.md)
- ![Procedure](../../../../../Images/procedure.svg) [insertSpecification_Configuration](../Procedures/insertSpecification_Configuration.md)
- ![Procedure](../../../../../Images/procedure.svg) [updateSpecification_Configuration](../Procedures/updateSpecification_Configuration.md)
- ![Function](../../../../../Images/function.svg) [existSpecification_Configuration](../Functions/existSpecification_Configuration.md)
- ![Function](../../../../../Images/function.svg) [selectSpecification_Configurations](../Functions/selectSpecification_Configurations.md)
- ![Trigger](../../../../../Images/trigger.svg) [deleteConfigurationsChilds](../Triggers/deleteConfigurationsChilds.md)


||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 25/06/2024|
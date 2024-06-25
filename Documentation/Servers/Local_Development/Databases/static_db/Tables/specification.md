###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Tables](Tables.md)>specification


# ![logo](../../../../../Images/table64.svg) specification

## <a name="#Description"></a>Description
> Specification of material
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Engine|InnoDB|
|Auto Increment|22|
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
|Created|25/6/2024 00:48:11|
|Last Modified|24/6/2024 23:46:56|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Unsigned|Zerofill|Binary|Not Null|Auto Increment|Default|Virtual|Invisible|Description|
|:---:|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)[![Indexes ](../../../../../Images/index.svg)](#Indexes)|id|INT||11||True|False|False|True|True||False|False||
|[![Foreign Keys FK_specification_material_id: material](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes FK_specification_material_id](../../../../../Images/index.svg)](#Indexes)|material|INT||11||True|False|False|True|False||False|False||
||name|VARCHAR|15|||False|False|False|True|False||False|False||
||description|VARCHAR|120|||False|False|False|True|False|'Sin Descripción'|False|False||
||createdAt|DATETIME||0||False|False|False|True|False||False|False||
||updatedAt|DATETIME||0||False|False|False|True|False|CURRENT_TIMESTAMP|False|False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)||id|True|None|0|
||FK_specification_material_id|material|False|None|0|

## <a name="#Triggers"></a>Triggers
|Name|Type|Event|Security|Definer|
|---|---|---|---|---|
|deleteConfigurationsChilds|BEFORE|DELETE|Definer|root|

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Delete Rule|Update Rule|
|---|---|---|---|
|FK_specification_material_id|id|N/S|N/S|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE specification (
  id int UNSIGNED NOT NULL AUTO_INCREMENT,
  material int UNSIGNED NOT NULL,
  name varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  description varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Sin Descripción',
  createdAt datetime NOT NULL,
  updatedAt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci,
COMMENT = 'Specification of material';

ALTER TABLE specification
ADD CONSTRAINT FK_specification_material_id FOREIGN KEY (material)
REFERENCES material (id) ON UPDATE CASCADE;
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Table](../../../../../Images/table.svg) [material](material.md)


## <a name="#UsedBy"></a>Used By _`12`_
- ![Procedure](../../../../../Images/procedure.svg) [selectSpecifications](../Procedures/selectSpecifications.md)
- ![Procedure](../../../../../Images/procedure.svg) [deleteSpecification](../Procedures/deleteSpecification.md)
- ![Procedure](../../../../../Images/procedure.svg) [insertSpecification](../Procedures/insertSpecification.md)
- ![Procedure](../../../../../Images/procedure.svg) [insertSpecification_Configuration](../Procedures/insertSpecification_Configuration.md)
- ![Procedure](../../../../../Images/procedure.svg) [updateSpecification](../Procedures/updateSpecification.md)
- ![Trigger](../../../../../Images/trigger.svg) [deleteConfigurationsChilds](../Triggers/deleteConfigurationsChilds.md)
- ![Table](../../../../../Images/table.svg) [specification_configuration](specification_configuration.md)
- ![Function](../../../../../Images/function.svg) [existConfiguration](../Functions/existConfiguration.md)
- ![Function](../../../../../Images/function.svg) [existSpecification](../Functions/existSpecification.md)
- ![Function](../../../../../Images/function.svg) [existSpecimen](../Functions/existSpecimen.md)
- ![Function](../../../../../Images/function.svg) [selectSpecifications](../Functions/selectSpecifications.md)
- ![Trigger](../../../../../Images/trigger.svg) [deleteMaterialChilds](../Triggers/deleteMaterialChilds.md)


||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 25/06/2024|
###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Tables](Tables.md)>standard


# ![logo](../../../../../Images/table64.svg) standard

## <a name="#Description"></a>Description
> Standards: ISO, IRAM, ...
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Engine|InnoDB|
|Auto Increment|7|
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
|Created|11/6/2024 11:06:02|
|Last Modified|24/6/2024 14:14:44|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Unsigned|Zerofill|Binary|Not Null|Auto Increment|Default|Virtual|Invisible|Description|
|:---:|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)[![Indexes ](../../../../../Images/index.svg)](#Indexes)|id|INT||11||True|False|False|True|True||False|False||
||name|VARCHAR|60|||False|False|False|True|False||False|False||
||createdAt|DATETIME||0||False|False|False|True|False|CURRENT_TIMESTAMP|False|False||
||updatedAt|DATETIME||0||False|False|False|False|False|CURRENT_TIMESTAMP|False|False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)||id|True|None|0|

## <a name="#Triggers"></a>Triggers
|Name|Type|Event|Security|Definer|
|---|---|---|---|---|
|deleteStandardChilds|BEFORE|DELETE|Definer|root|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE standard (
  id int UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  createdAt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatedAt datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci,
COMMENT = 'Standards: ISO, IRAM, ...';
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By _`19`_
- ![Procedure](../../../../../Images/procedure.svg) [selectMaterials](../Procedures/selectMaterials.md)
- ![Procedure](../../../../../Images/procedure.svg) [selectStandards](../Procedures/selectStandards.md)
- ![Procedure](../../../../../Images/procedure.svg) [deleteStandard](../Procedures/deleteStandard.md)
- ![Procedure](../../../../../Images/procedure.svg) [insertConditionalPeriod](../Procedures/insertConditionalPeriod.md)
- ![Procedure](../../../../../Images/procedure.svg) [insertEndCap](../Procedures/insertEndCap.md)
- ![Procedure](../../../../../Images/procedure.svg) [insertEnviroment](../Procedures/insertEnviroment.md)
- ![Procedure](../../../../../Images/procedure.svg) [insertRelatedMaterial](../Procedures/insertRelatedMaterial.md)
- ![Procedure](../../../../../Images/procedure.svg) [insertStandard](../Procedures/insertStandard.md)
- ![Procedure](../../../../../Images/procedure.svg) [insertTestType](../Procedures/insertTestType.md)
- ![Procedure](../../../../../Images/procedure.svg) [selectStandardsJSON](../Procedures/selectStandardsJSON.md)
- ![Procedure](../../../../../Images/procedure.svg) [updateStandard](../Procedures/updateStandard.md)
- ![Table](../../../../../Images/table.svg) [conditional_period](conditional_period.md)
- ![Table](../../../../../Images/table.svg) [endcap](endcap.md)
- ![Table](../../../../../Images/table.svg) [enviroment](enviroment.md)
- ![Table](../../../../../Images/table.svg) [material_has_standard](material_has_standard.md)
- ![Trigger](../../../../../Images/trigger.svg) [deleteStandardChilds](../Triggers/deleteStandardChilds.md)
- ![Table](../../../../../Images/table.svg) [test_type](test_type.md)
- ![Procedure](../../../../../Images/procedure.svg) [selectStandarsComplete](../Procedures/selectStandarsComplete.md)
- ![Function](../../../../../Images/function.svg) [existStandard](../Functions/existStandard.md)


||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 25/06/2024|
###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Tables](Tables.md)>material


# ![logo](../../../../../Images/table64.svg) material

## <a name="#Description"></a>Description
> Material of Hoop
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Engine|InnoDB|
|Auto Increment|14|
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
|Created|25/6/2024 00:48:45|
|Last Modified|1/1/0001 00:00:00|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Unsigned|Zerofill|Binary|Not Null|Auto Increment|Default|Virtual|Invisible|Description|
|:---:|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)[![Indexes ](../../../../../Images/index.svg)](#Indexes)|id|INT||11||True|False|False|True|True||False|False||
||name|VARCHAR|15|||False|False|False|True|False||False|False||
||description|VARCHAR|120|||False|False|False|True|False|'Sin descripción'|False|False||
||createdAt|DATETIME||0||False|False|False|True|False|CURRENT_TIMESTAMP|False|False||
||updatedAt|DATETIME||0||False|False|False|True|False|CURRENT_TIMESTAMP|False|False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)||id|True|None|0|

## <a name="#Triggers"></a>Triggers
|Name|Type|Event|Security|Definer|
|---|---|---|---|---|
|deleteMaterialChilds|BEFORE|DELETE|Definer|root|

## <a name="#Permissions"></a>Permissions
|Action|Owner|
|---|---|
|SELECT|[databaseManager@%](../../../Users/databaseManager@%.md)|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE material (
  id int UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  description varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Sin descripción',
  createdAt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatedAt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci,
COMMENT = 'Material of Hoop';
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![User](../../../../../Images/user.svg) [databaseManager@%](../../../Users/databaseManager@%.md)


## <a name="#UsedBy"></a>Used By _`13`_
- ![Procedure](../../../../../Images/procedure.svg) [selectMaterials](../Procedures/selectMaterials.md)
- ![Procedure](../../../../../Images/procedure.svg) [deleteMaterial](../Procedures/deleteMaterial.md)
- ![Procedure](../../../../../Images/procedure.svg) [insertMaterial](../Procedures/insertMaterial.md)
- ![Procedure](../../../../../Images/procedure.svg) [insertRelatedMaterial](../Procedures/insertRelatedMaterial.md)
- ![Procedure](../../../../../Images/procedure.svg) [insertSpecification](../Procedures/insertSpecification.md)
- ![Procedure](../../../../../Images/procedure.svg) [selectMaterialsJSON](../Procedures/selectMaterialsJSON.md)
- ![Procedure](../../../../../Images/procedure.svg) [updateMaterial](../Procedures/updateMaterial.md)
- ![Trigger](../../../../../Images/trigger.svg) [deleteMaterialChilds](../Triggers/deleteMaterialChilds.md)
- ![Table](../../../../../Images/table.svg) [material_has_standard](material_has_standard.md)
- ![Table](../../../../../Images/table.svg) [specification](specification.md)
- ![Procedure](../../../../../Images/procedure.svg) [selectStandarsComplete](../Procedures/selectStandarsComplete.md)
- ![Function](../../../../../Images/function.svg) [existMaterial](../Functions/existMaterial.md)
- ![Function](../../../../../Images/function.svg) [selectMaterials_has_Standard](../Functions/selectMaterials_has_Standard.md)


||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 26/06/2024|
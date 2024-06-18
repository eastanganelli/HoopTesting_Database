###### Hoop Testing
___
Project>[Servers](../../../../Servers.md)>[Local_Development](../../../Local_Development.md)>[Databases](../../Databases.md)>[static_db](../static_db.md)>[Tables](Tables.md)>operator


# ![logo](../../../../../Images/table64.svg) operator

## <a name="#Description"></a>Description
> 
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Engine|InnoDB|
|Auto Increment|15|
|Average Row Length|2730|
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
|Created|11/6/2024 11:06:03|
|Last Modified|1/1/0001 00:00:00|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Unsigned|Zerofill|Binary|Not Null|Auto Increment|Default|Virtual|Invisible|Description|
|:---:|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)[![Indexes ](../../../../../Images/index.svg)](#Indexes)|id|INT||11||True|False|False|True|True||False|False||
||dni|INT||11||True|False|False|True|False||False|False||
||name|VARCHAR|50|||False|False|False|True|False||False|False||
||familyname|VARCHAR|50|||False|False|False|True|False||False|False||
||createdAt|DATETIME||4||False|False|False|True|False|CURRENT_TIMESTAMP(4)|False|False||
||updatedAt|DATETIME||4||False|False|False|True|False|CURRENT_TIMESTAMP(4)|False|False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)||id|True|None|0|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE operator (
  id int UNSIGNED NOT NULL AUTO_INCREMENT,
  dni int UNSIGNED NOT NULL,
  name varchar(50) NOT NULL,
  familyname varchar(50) NOT NULL,
  createdAt datetime(4) NOT NULL DEFAULT CURRENT_TIMESTAMP(4),
  updatedAt datetime(4) NOT NULL DEFAULT CURRENT_TIMESTAMP(4) ON UPDATE CURRENT_TIMESTAMP(4),
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 2730,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By _`6`_
- ![Procedure](../../../../../Images/procedure.svg) [selectOperators](../Procedures/selectOperators.md)
- ![Procedure](../../../../../Images/procedure.svg) [deleteOperator](../Procedures/deleteOperator.md)
- ![Procedure](../../../../../Images/procedure.svg) [insertOperator](../Procedures/insertOperator.md)
- ![Procedure](../../../../../Images/procedure.svg) [selectOperatorsJSON](../Procedures/selectOperatorsJSON.md)
- ![Procedure](../../../../../Images/procedure.svg) [updateOperator](../Procedures/updateOperator.md)
- ![Function](../../../../../Images/function.svg) [existOperator](../Functions/existOperator.md)


||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 18/06/2024|
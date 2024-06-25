###### Hoop Testing
___
Project>[Servers](../../Servers.md)>[Local_Development](../Local_Development.md)>[Users](Users.md)>databaseManager@%


# ![logo](../../../Images/user64.svg) databaseManager@%


## <a name="#ObjectLevelPermissions"></a>Object Level Permissions _`29`_
|Type|Action|Object Name|Object Type|
|---|---|---|---|
|Grant|EXECUTE|deleteconditionalperiod|Procedure|
|Grant|EXECUTE|deleteendcap|Procedure|
|Grant|EXECUTE|deleteenviroment|Procedure|
|Grant|EXECUTE|deletematerial|Procedure|
|Grant|EXECUTE|deleteoperator|Procedure|
|Grant|EXECUTE|deleterelatedmaterial|Procedure|
|Grant|EXECUTE|deletespecification_configuration|Procedure|
|Grant|EXECUTE|deletespecification|Procedure|
|Grant|EXECUTE|deletestandard|Procedure|
|Grant|EXECUTE|deletetesttype|Procedure|
|Grant|EXECUTE|insertconditionalperiod|Procedure|
|Grant|EXECUTE|insertendcap|Procedure|
|Grant|EXECUTE|insertenviroment|Procedure|
|Grant|EXECUTE|insertmaterial|Procedure|
|Grant|EXECUTE|insertoperator|Procedure|
|Grant|EXECUTE|insertrelatedmaterial|Procedure|
|Grant|EXECUTE|insertspecification_configuration|Procedure|
|Grant|EXECUTE|insertspecification|Procedure|
|Grant|EXECUTE|insertstandard|Procedure|
|Grant|EXECUTE|inserttesttype|Procedure|
|Grant|EXECUTE|selectmaterialsjson|Procedure|
|Grant|EXECUTE|selectoperatorsjson|Procedure|
|Grant|EXECUTE|selectstandardsjson|Procedure|
|Grant|EXECUTE|updatematerial|Procedure|
|Grant|EXECUTE|updateoperator|Procedure|
|Grant|EXECUTE|updatespecification_configuration|Procedure|
|Grant|EXECUTE|updatespecification|Procedure|
|Grant|EXECUTE|updatestandard|Procedure|
|Grant|SELECT|material|Table|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE USER 'databaseManager'@'%' IDENTIFIED WITH caching_sha2_password PASSWORD EXPIRE NEVER;
GRANT EXECUTE ON PROCEDURE static_db.deleteconditionalperiod TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.deleteendcap TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.deleteenviroment TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.deletematerial TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.deleteoperator TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.deleterelatedmaterial TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.deletespecification TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.deletespecification_configuration TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.deletestandard TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.deletetesttype TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.insertconditionalperiod TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.insertendcap TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.insertenviroment TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.insertmaterial TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.insertoperator TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.insertrelatedmaterial TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.insertspecification TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.insertspecification_configuration TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.insertstandard TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.inserttesttype TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.selectmaterialsjson TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.selectoperatorsjson TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.selectstandardsjson TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.updatematerial TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.updateoperator TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.updatespecification TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.updatespecification_configuration TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.updatestandard TO 'databaseManager'@'%';
GRANT SELECT ON TABLE static_db.material TO 'databaseManager'@'%';
```

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 25/06/2024|
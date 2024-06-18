###### Hoop Testing
___
Project>[Servers](../../Servers.md)>[Local_Development](../Local_Development.md)>[Users](Users.md)>databaseManager@%


# ![logo](../../../Images/user64.svg) databaseManager@%


## <a name="#ObjectLevelPermissions"></a>Object Level Permissions _`38`_
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
|Grant|EXECUTE|selectconditionalperiods|Procedure|
|Grant|EXECUTE|selectendcaps|Procedure|
|Grant|EXECUTE|selectenviroment|Procedure|
|Grant|EXECUTE|selectmaterials|Procedure|
|Grant|EXECUTE|selectmaterialsjson|Procedure|
|Grant|EXECUTE|selectoperators|Procedure|
|Grant|EXECUTE|selectoperatorsjson|Procedure|
|Grant|EXECUTE|selectsettingsspecification|Procedure|
|Grant|EXECUTE|selectspecifications|Procedure|
|Grant|EXECUTE|selectstandards|Procedure|
|Grant|EXECUTE|selectstandardsjson|Procedure|
|Grant|EXECUTE|selectstandarscomplete|Procedure|
|Grant|EXECUTE|selecttesttype|Procedure|
|Grant|EXECUTE|updatematerial|Procedure|
|Grant|EXECUTE|updateoperator|Procedure|
|Grant|EXECUTE|updatespecification_configuration|Procedure|
|Grant|EXECUTE|updatespecification|Procedure|
|Grant|EXECUTE|updatestandard|Procedure|

## <a name="#RolePrivileges"></a>Role Privileges _`1`_
|Type|Object Name|Object Type|With Admin Option|
|---|---|---|---|
|Grant|reporting@%|DatabaseRole|False|

## <a name="#DefaultRoles"></a>Default Roles _`1`_
- ![Role](../../../Images/role.svg) reporting@%


## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE USER 'databaseManager'@'%' IDENTIFIED WITH mysql_native_password PASSWORD EXPIRE NEVER;
GRANT 'reporting'@'%' TO 'databaseManager'@'%';
SET DEFAULT ROLE 'reporting'@'%' TO 'databaseManager'@'%';
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
GRANT EXECUTE ON PROCEDURE static_db.selectconditionalperiods TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.selectendcaps TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.selectenviroment TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.selectmaterials TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.selectmaterialsjson TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.selectoperators TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.selectoperatorsjson TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.selectsettingsspecification TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.selectspecifications TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.selectstandards TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.selectstandardsjson TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.selectstandarscomplete TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.selecttesttype TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.updatematerial TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.updateoperator TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.updatespecification TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.updatespecification_configuration TO 'databaseManager'@'%';
GRANT EXECUTE ON PROCEDURE static_db.updatestandard TO 'databaseManager'@'%';
```

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 18/06/2024|
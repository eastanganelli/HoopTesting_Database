###### Hoop Testing
___
Project>[Servers](../../Servers.md)>[Local_Development](../Local_Development.md)>[Users](Users.md)>dataCollector@%


# ![logo](../../../Images/user64.svg) dataCollector@%


## <a name="#ObjectLevelPermissions"></a>Object Level Permissions _`16`_
|Type|Action|Object Name|Object Type|
|---|---|---|---|
|Grant|EXECUTE|countspecimens|Procedure|
|Grant|EXECUTE|insertdata|Procedure|
|Grant|EXECUTE|insertsample|Procedure|
|Grant|EXECUTE|insertspecimen|Procedure|
|Grant|EXECUTE|selectconditionalperiods|Procedure|
|Grant|EXECUTE|selectendcaps|Procedure|
|Grant|EXECUTE|selectenviroment|Procedure|
|Grant|EXECUTE|selectmaterials|Procedure|
|Grant|EXECUTE|selectoperators|Procedure|
|Grant|EXECUTE|selectsample|Procedure|
|Grant|EXECUTE|selectsampleid|Procedure|
|Grant|EXECUTE|selectsettingsspecification|Procedure|
|Grant|EXECUTE|selectspecifications|Procedure|
|Grant|EXECUTE|selectspecimen|Procedure|
|Grant|EXECUTE|selectstandards|Procedure|
|Grant|EXECUTE|selecttesttype|Procedure|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE USER 'dataCollector'@'%' IDENTIFIED WITH caching_sha2_password PASSWORD EXPIRE NEVER;
GRANT EXECUTE ON PROCEDURE data_db.countspecimens TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE data_db.insertdata TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE data_db.insertsample TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE data_db.insertspecimen TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE static_db.selectconditionalperiods TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE static_db.selectendcaps TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE static_db.selectenviroment TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE static_db.selectmaterials TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE static_db.selectoperators TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE data_db.selectsample TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE data_db.selectsampleid TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE static_db.selectsettingsspecification TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE static_db.selectspecifications TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE data_db.selectspecimen TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE static_db.selectstandards TO 'dataCollector'@'%';
GRANT EXECUTE ON PROCEDURE static_db.selecttesttype TO 'dataCollector'@'%';
```

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 25/06/2024|
###### Hoop Testing
___
Project>[Servers](../../Servers.md)>[Local_Development](../Local_Development.md)>[Users](Users.md)>reportGenerator@%


# ![logo](../../../Images/user64.svg) reportGenerator@%


## <a name="#ObjectLevelPermissions"></a>Object Level Permissions _`7`_
|Type|Action|Object Name|Object Type|
|---|---|---|---|
|Grant|EXECUTE|static_db|Database|
|Grant|EXECUTE|deletetest|Procedure|
|Grant|EXECUTE|selectcomparetests|Procedure|
|Grant|EXECUTE|selecttestdata|Procedure|
|Grant|EXECUTE|selecttest|Procedure|
|Grant|EXECUTE|selecttests|Procedure|
|Grant|EXECUTE|updatespecimen|Procedure|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE USER 'reportGenerator'@'%' IDENTIFIED WITH caching_sha2_password PASSWORD EXPIRE NEVER;
GRANT EXECUTE ON *.* TO 'reportGenerator'@'%';
GRANT EXECUTE ON static_db.* TO 'reportGenerator'@'%';
GRANT EXECUTE ON PROCEDURE data_db.deletetest TO 'reportGenerator'@'%';
GRANT EXECUTE ON PROCEDURE data_db.selectcomparetests TO 'reportGenerator'@'%';
GRANT EXECUTE ON PROCEDURE data_db.selecttest TO 'reportGenerator'@'%';
GRANT EXECUTE ON PROCEDURE data_db.selecttestdata TO 'reportGenerator'@'%';
GRANT EXECUTE ON PROCEDURE data_db.selecttests TO 'reportGenerator'@'%';
GRANT EXECUTE ON PROCEDURE data_db.updatespecimen TO 'reportGenerator'@'%';
```

||||
|---|---|---|
|Author: Ezequiel Augusto Stanganelli|Copyright © All Rights Reserved|Created: 26/06/2024|
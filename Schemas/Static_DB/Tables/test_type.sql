﻿CREATE TABLE `test_type` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `standard` INT UNSIGNED NOT NULL,
  `testType` VARCHAR(150) NOT NULL,
  `createdAt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 5,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
ROW_FORMAT = DYNAMIC;

ALTER TABLE `test_type` 
  ADD CONSTRAINT `FK_test_type_standard_id` FOREIGN KEY (standard)
    REFERENCES standard(id) ON DELETE CASCADE ON UPDATE CASCADE;
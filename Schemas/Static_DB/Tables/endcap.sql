﻿CREATE TABLE `endcap` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `standard` INT UNSIGNED NOT NULL,
  `name` VARCHAR(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `createdAt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 5461,
CHARACTER SET latin1,
COLLATE latin1_swedish_ci,
COMMENT = 'End Cap related to a Standard',
ROW_FORMAT = DYNAMIC;

ALTER TABLE `endcap` 
  ADD CONSTRAINT `FK_endcap_standard_id` FOREIGN KEY (standard)
    REFERENCES standard(id) ON DELETE CASCADE ON UPDATE CASCADE;
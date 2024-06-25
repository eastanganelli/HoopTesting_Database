﻿CREATE TABLE `conditional_period` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `standard` INT UNSIGNED NOT NULL,
  `time` INT UNSIGNED NOT NULL DEFAULT 0,
  `timeType` VARCHAR(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'h',
  `aproxTime` INT UNSIGNED NOT NULL DEFAULT 0,
  `aproxType` VARCHAR(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'min',
  `minwall` INT UNSIGNED NOT NULL,
  `maxwall` INT UNSIGNED NOT NULL,
  `createdAt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedtAt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci,
COMMENT = 'Conditional Period related to Standard',
ROW_FORMAT = DYNAMIC;

ALTER TABLE `conditional_period` 
  ADD CONSTRAINT `FK_conditional_period_standard_id` FOREIGN KEY (standard)
    REFERENCES standard(id);
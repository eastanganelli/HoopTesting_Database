﻿CREATE TABLE `specimen` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `sample` INT UNSIGNED NOT NULL,
  `targetPressure` INT NOT NULL,
  `targetTemperature` INT NOT NULL,
  `operator` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `enviroment` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `testName` VARCHAR(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `endCap` VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `failText` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Sin Fallas',
  `remark` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Sin Observaciones',
  `createdAt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 910,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci,
COMMENT = 'Test specimen',
ROW_FORMAT = DYNAMIC;

ALTER TABLE `specimen` 
  ADD CONSTRAINT `FK_test_specimen_test_sample_id` FOREIGN KEY (sample)
    REFERENCES sample(id);
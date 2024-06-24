﻿CREATE TABLE `material_has_standard` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `material` INT UNSIGNED NOT NULL,
  `standard` INT UNSIGNED NOT NULL,
  `type` VARCHAR(25) NOT NULL DEFAULT 'Plastico',
  `createdAt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
ROW_FORMAT = DYNAMIC;

ALTER TABLE `material_has_standard` 
  ADD CONSTRAINT `FK_material_has_standard_material_id` FOREIGN KEY (material)
    REFERENCES material(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `material_has_standard` 
  ADD CONSTRAINT `FK_material_has_standard_standard_id` FOREIGN KEY (standard)
    REFERENCES standard(id) ON DELETE CASCADE ON UPDATE CASCADE;
CREATE TABLE `settings_specification` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `specification` INT UNSIGNED NOT NULL,
  `time` SMALLINT UNSIGNED NOT NULL,
  `timeType` VARCHAR(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'h',
  `temperature` TINYINT UNSIGNED NOT NULL,
  `createdAt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci,
COMMENT = 'Settings by Specification',
ROW_FORMAT = DYNAMIC;

ALTER TABLE `settings_specification` 
  ADD INDEX FK_period_by_material_material_id(specification);

ALTER TABLE `settings_specification` 
  ADD CONSTRAINT `FK_specification_configuration_specification_id` FOREIGN KEY (specification)
    REFERENCES specification(id) ON UPDATE CASCADE;
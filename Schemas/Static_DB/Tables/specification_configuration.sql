CREATE TABLE `specification_configuration` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `specification` INT UNSIGNED NOT NULL,
  `time` SMALLINT UNSIGNED NOT NULL,
  `timeType` VARCHAR(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'H',
  `temperature` TINYINT UNSIGNED NOT NULL,
  `createdAt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 12,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci,
COMMENT = 'Conditional period by Specification',
ROW_FORMAT = DYNAMIC;

ALTER TABLE `specification_configuration` 
  ADD INDEX FK_period_by_material_material_id(specification);

ALTER TABLE `specification_configuration` 
  ADD CONSTRAINT `FK_specification_configuration_specification_id` FOREIGN KEY (specification)
    REFERENCES specification(id) ON UPDATE CASCADE;
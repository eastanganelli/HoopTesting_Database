CREATE TABLE `data` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `specimen` INT UNSIGNED NOT NULL,
  `pressure` DOUBLE NOT NULL,
  `temperature` DOUBLE NOT NULL,
  `createdAt` DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4),
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 782365,
AVG_ROW_LENGTH = 58,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci,
COMMENT = 'Data Recollected from PLC',
ROW_FORMAT = DYNAMIC;

ALTER TABLE `data` 
  ADD INDEX IDX_test_data_test_specimen(specimen);

ALTER TABLE `data` 
  ADD CONSTRAINT `FK_test_data_test_specimen_id` FOREIGN KEY (specimen)
    REFERENCES specimen(id);
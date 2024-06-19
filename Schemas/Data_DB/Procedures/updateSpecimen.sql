DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE PROCEDURE `updateSpecimen`(IN idSpecimen int UNSIGNED, IN testName varchar(150), IN operator varchar(40), IN fail varchar(255), IN remark varchar(255))
BEGIN

  UPDATE LOW_PRIORITY specimen ts
  SET ts.testName = testName,
      ts.operator = operator,
      ts.failText = fail,
      ts.remark = remark,
      ts.updatedAt = CURRENT_TIMESTAMP()
  WHERE ts.id = idSpecimen;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE updateSpecimen TO 'reportGenerator'@'%';
GRANT EXECUTE ON PROCEDURE updateSpecimen TO 'reporting'@'%';
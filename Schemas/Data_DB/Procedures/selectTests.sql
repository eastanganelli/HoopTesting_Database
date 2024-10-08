﻿DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE PROCEDURE `selectTests`()
  DETERMINISTIC
BEGIN

  SELECT
    ts.id AS idSample,
    ts.material AS material,
    ts.specification AS specification,
    ts.diamreal AS diameter,
    ts.wallthick AS wallThickness,
    ts.lenfree AS length,
    selectTestsSpecimens(ts.id) AS mySpecimens
  FROM sample ts;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE selectTests TO 'reportGenerator'@'%';
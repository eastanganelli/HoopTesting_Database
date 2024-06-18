DELIMITER $$

SET @saved_sql_mode = @@sql_mode
$$
SET @@sql_mode = 'NO_AUTO_VALUE_ON_ZERO'
$$
CREATE PROCEDURE `insertSample`(IN standard varchar(25), IN material varchar(10), IN specification varchar(6), IN diamnom int UNSIGNED, IN diamreal int UNSIGNED, IN wallthick int UNSIGNED, IN lenfree int UNSIGNED, IN lentotal int UNSIGNED, IN targetpressure int, IN targettemp int, IN condPeriod varchar(15))
  DETERMINISTIC
BEGIN

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN

    GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, @message = MESSAGE_TEXT;
    SELECT
      @message AS `idSample`;

  END;

  INSERT INTO sample (standard, condPeriod, material, specification, targettemp, targetpressure, diamreal, diamnom, wallthick, lenfree, lentotal)
    VALUES (standard, condPeriod, material, specification, targettemp, targetpressure, diamreal, diamnom, wallthick, lenfree, lentotal);

  SELECT
    ts.id AS `idSample`
  FROM sample ts
  ORDER BY ts.id DESC
  LIMIT 1;

END
$$

DELIMITER ;

GRANT EXECUTE ON PROCEDURE insertSample TO 'dataCollector'@'%';
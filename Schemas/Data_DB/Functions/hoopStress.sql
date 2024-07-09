DELIMITER $$

CREATE FUNCTION `hoopStress`(idSample INT UNSIGNED, pressure INT)
  RETURNS INT(11)
  DETERMINISTIC
BEGIN

set @hoopResult = 0;
    
    SELECT
      (((pressure * (s.diamreal - s.wallthick)) / (10 * 2 * s.wallthick))) INTO @hoopResult
    FROM sample s
    WHERE s.id = idSample;

RETURN @hoopResult;
END
$$

DELIMITER ;
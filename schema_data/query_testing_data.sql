USE STEL_DB_DATA;

/*
set @idSample = NULL;
#CALL insertSample('ISO-1167-4560', 'PE', 'PE100', 50, 50, 5, 340, 560, 25, 20, @idSample);
CALL insertSample('ISO-1167-4560', 'PE', 'PE50', 50, 50, 5, 180, 430, 34, 45, @idSample);
SELECT @idSample;


SELECT
COUNT(ts.test_sample)
FROM test_specimen ts
WHERE ts.test_sample = idSample;
*/

# SELECT specimenExists(1, '2024/01/5 03:17:00') AS RESULTspecimenExists;

/*
SELECT
ts.id
FROM test_specimen ts
WHERE (ts.test_sample = 1 AND ts.start = '2024/01/5 03:17:00')
LIMIT 1;
*/

CALL insertSample('ISO-1167-1996', 'PE', 'PE100', 50, 50, 5, 350, 560, 25, 20, '3 h ± 15 min');
CALL insertSpecimen(1,1,'water');

CALL insertData(13,0.07,0);
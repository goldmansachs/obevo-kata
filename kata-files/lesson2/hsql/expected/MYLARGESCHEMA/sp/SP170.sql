CREATE PROCEDURE SP170(OUT MYCOUNT INTEGER) SPECIFIC SP170_94886 LANGUAGE SQL NOT DETERMINISTIC READS SQL DATA NEW SAVEPOINT LEVEL BEGIN ATOMIC DECLARE MYVAR INT;SELECT COUNT(*)INTO MYCOUNT FROM TABLE347;SELECT COUNT(*)INTO MYCOUNT FROM TABLE214;SELECT COUNT(*)INTO MYCOUNT FROM TABLE309;SELECT COUNT(*)INTO MYCOUNT FROM VIEW58;SELECT COUNT(*)INTO MYCOUNT FROM VIEW10;SELECT COUNT(*)INTO MYCOUNT FROM VIEW45;CALL SP512(MYVAR);CALL SP708(MYVAR);CALL SP271(MYVAR);CALL SP645(MYVAR);END
GO
CREATE PROCEDURE SP892(OUT MYCOUNT INTEGER) SPECIFIC SP892_61544 LANGUAGE SQL NOT DETERMINISTIC READS SQL DATA NEW SAVEPOINT LEVEL BEGIN ATOMIC DECLARE MYVAR INT;SELECT COUNT(*)INTO MYCOUNT FROM TABLE274;SELECT COUNT(*)INTO MYCOUNT FROM TABLE254;SELECT COUNT(*)INTO MYCOUNT FROM TABLE62;SELECT COUNT(*)INTO MYCOUNT FROM VIEW37;SELECT COUNT(*)INTO MYCOUNT FROM VIEW69;SELECT COUNT(*)INTO MYCOUNT FROM VIEW53;CALL SP724(MYVAR);CALL SP330(MYVAR);CALL SP774(MYVAR);CALL SP87(MYVAR);END
GO
CREATE PROCEDURE SP899(OUT MYCOUNT INTEGER) SPECIFIC SP899_98587 LANGUAGE SQL NOT DETERMINISTIC READS SQL DATA NEW SAVEPOINT LEVEL BEGIN ATOMIC DECLARE MYVAR INT;SELECT COUNT(*)INTO MYCOUNT FROM TABLE266;SELECT COUNT(*)INTO MYCOUNT FROM TABLE448;SELECT COUNT(*)INTO MYCOUNT FROM TABLE115;SELECT COUNT(*)INTO MYCOUNT FROM VIEW19;SELECT COUNT(*)INTO MYCOUNT FROM VIEW90;SELECT COUNT(*)INTO MYCOUNT FROM VIEW31;CALL SP312(MYVAR);CALL SP208(MYVAR);CALL SP160(MYVAR);CALL SP591(MYVAR);END
GO
CREATE PROCEDURE SP644(OUT MYCOUNT INTEGER) SPECIFIC SP644_98815 LANGUAGE SQL NOT DETERMINISTIC READS SQL DATA NEW SAVEPOINT LEVEL BEGIN ATOMIC DECLARE MYVAR INT;SELECT COUNT(*)INTO MYCOUNT FROM TABLE66;SELECT COUNT(*)INTO MYCOUNT FROM TABLE353;SELECT COUNT(*)INTO MYCOUNT FROM TABLE470;SELECT COUNT(*)INTO MYCOUNT FROM VIEW1;SELECT COUNT(*)INTO MYCOUNT FROM VIEW40;SELECT COUNT(*)INTO MYCOUNT FROM VIEW30;CALL SP219(MYVAR);CALL SP883(MYVAR);CALL SP357(MYVAR);CALL SP899(MYVAR);END
GO
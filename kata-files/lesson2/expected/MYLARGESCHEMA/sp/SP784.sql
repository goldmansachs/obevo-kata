CREATE PROCEDURE SP784(OUT MYCOUNT INTEGER) SPECIFIC SP784_97211 LANGUAGE SQL NOT DETERMINISTIC READS SQL DATA NEW SAVEPOINT LEVEL BEGIN ATOMIC DECLARE MYVAR INT;SELECT COUNT(*)INTO MYCOUNT FROM TABLE217;SELECT COUNT(*)INTO MYCOUNT FROM TABLE476;SELECT COUNT(*)INTO MYCOUNT FROM TABLE165;SELECT COUNT(*)INTO MYCOUNT FROM VIEW89;SELECT COUNT(*)INTO MYCOUNT FROM VIEW7;SELECT COUNT(*)INTO MYCOUNT FROM VIEW34;CALL SP394(MYVAR);CALL SP573(MYVAR);CALL SP925(MYVAR);CALL SP315(MYVAR);END
GO
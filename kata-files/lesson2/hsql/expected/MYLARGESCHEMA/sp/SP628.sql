CREATE PROCEDURE SP628(OUT MYCOUNT INTEGER) SPECIFIC SP628_84389 LANGUAGE SQL NOT DETERMINISTIC READS SQL DATA NEW SAVEPOINT LEVEL BEGIN ATOMIC DECLARE MYVAR INT;SELECT COUNT(*)INTO MYCOUNT FROM TABLE370;SELECT COUNT(*)INTO MYCOUNT FROM TABLE261;SELECT COUNT(*)INTO MYCOUNT FROM TABLE174;SELECT COUNT(*)INTO MYCOUNT FROM VIEW16;SELECT COUNT(*)INTO MYCOUNT FROM VIEW40;SELECT COUNT(*)INTO MYCOUNT FROM VIEW65;CALL SP261(MYVAR);CALL SP676(MYVAR);CALL SP790(MYVAR);CALL SP351(MYVAR);END
GO
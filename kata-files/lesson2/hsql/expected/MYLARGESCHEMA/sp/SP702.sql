CREATE PROCEDURE SP702(OUT MYCOUNT INTEGER) SPECIFIC SP702_68566 LANGUAGE SQL NOT DETERMINISTIC READS SQL DATA NEW SAVEPOINT LEVEL BEGIN ATOMIC DECLARE MYVAR INT;SELECT COUNT(*)INTO MYCOUNT FROM TABLE473;SELECT COUNT(*)INTO MYCOUNT FROM TABLE348;SELECT COUNT(*)INTO MYCOUNT FROM TABLE288;SELECT COUNT(*)INTO MYCOUNT FROM VIEW26;SELECT COUNT(*)INTO MYCOUNT FROM VIEW5;SELECT COUNT(*)INTO MYCOUNT FROM VIEW34;CALL SP340(MYVAR);CALL SP370(MYVAR);CALL SP846(MYVAR);CALL SP93(MYVAR);END
GO
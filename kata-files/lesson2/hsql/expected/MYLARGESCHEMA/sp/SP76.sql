CREATE PROCEDURE SP76(OUT MYCOUNT INTEGER) SPECIFIC SP76_88853 LANGUAGE SQL NOT DETERMINISTIC READS SQL DATA NEW SAVEPOINT LEVEL BEGIN ATOMIC DECLARE MYVAR INT;SELECT COUNT(*)INTO MYCOUNT FROM TABLE301;SELECT COUNT(*)INTO MYCOUNT FROM TABLE72;SELECT COUNT(*)INTO MYCOUNT FROM TABLE453;SELECT COUNT(*)INTO MYCOUNT FROM VIEW81;SELECT COUNT(*)INTO MYCOUNT FROM VIEW3;SELECT COUNT(*)INTO MYCOUNT FROM VIEW35;CALL SP178(MYVAR);CALL SP305(MYVAR);CALL SP208(MYVAR);CALL SP253(MYVAR);END
GO
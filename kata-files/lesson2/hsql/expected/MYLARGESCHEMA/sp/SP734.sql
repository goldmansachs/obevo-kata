CREATE PROCEDURE SP734(OUT MYCOUNT INTEGER) SPECIFIC SP734_48185 LANGUAGE SQL NOT DETERMINISTIC READS SQL DATA NEW SAVEPOINT LEVEL BEGIN ATOMIC DECLARE MYVAR INT;SELECT COUNT(*)INTO MYCOUNT FROM TABLE162;SELECT COUNT(*)INTO MYCOUNT FROM TABLE235;SELECT COUNT(*)INTO MYCOUNT FROM TABLE62;SELECT COUNT(*)INTO MYCOUNT FROM VIEW71;SELECT COUNT(*)INTO MYCOUNT FROM VIEW50;SELECT COUNT(*)INTO MYCOUNT FROM VIEW65;CALL SP779(MYVAR);CALL SP52(MYVAR);CALL SP201(MYVAR);CALL SP804(MYVAR);END
GO
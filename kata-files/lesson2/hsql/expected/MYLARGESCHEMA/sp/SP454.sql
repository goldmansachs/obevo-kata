CREATE PROCEDURE SP454(OUT MYCOUNT INTEGER) SPECIFIC SP454_53075 LANGUAGE SQL NOT DETERMINISTIC READS SQL DATA NEW SAVEPOINT LEVEL BEGIN ATOMIC DECLARE MYVAR INT;SELECT COUNT(*)INTO MYCOUNT FROM TABLE230;SELECT COUNT(*)INTO MYCOUNT FROM TABLE49;SELECT COUNT(*)INTO MYCOUNT FROM TABLE414;SELECT COUNT(*)INTO MYCOUNT FROM VIEW5;SELECT COUNT(*)INTO MYCOUNT FROM VIEW31;SELECT COUNT(*)INTO MYCOUNT FROM VIEW32;CALL SP553(MYVAR);CALL SP767(MYVAR);CALL SP540(MYVAR);CALL SP106(MYVAR);END
GO
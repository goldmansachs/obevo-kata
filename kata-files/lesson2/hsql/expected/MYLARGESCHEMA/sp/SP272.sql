CREATE PROCEDURE SP272(OUT MYCOUNT INTEGER) SPECIFIC SP272_86827 LANGUAGE SQL NOT DETERMINISTIC READS SQL DATA NEW SAVEPOINT LEVEL BEGIN ATOMIC DECLARE MYVAR INT;SELECT COUNT(*)INTO MYCOUNT FROM TABLE175;SELECT COUNT(*)INTO MYCOUNT FROM TABLE194;SELECT COUNT(*)INTO MYCOUNT FROM TABLE87;SELECT COUNT(*)INTO MYCOUNT FROM VIEW23;SELECT COUNT(*)INTO MYCOUNT FROM VIEW64;SELECT COUNT(*)INTO MYCOUNT FROM VIEW74;CALL SP512(MYVAR);CALL SP319(MYVAR);CALL SP731(MYVAR);CALL SP363(MYVAR);END
GO
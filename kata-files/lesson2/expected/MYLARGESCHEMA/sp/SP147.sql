CREATE PROCEDURE SP147(OUT MYCOUNT INTEGER) SPECIFIC SP147_121115 LANGUAGE SQL NOT DETERMINISTIC READS SQL DATA NEW SAVEPOINT LEVEL BEGIN ATOMIC DECLARE MYVAR INT;SELECT COUNT(*)INTO MYCOUNT FROM TABLE486;SELECT COUNT(*)INTO MYCOUNT FROM TABLE22;SELECT COUNT(*)INTO MYCOUNT FROM TABLE191;SELECT COUNT(*)INTO MYCOUNT FROM VIEW58;SELECT COUNT(*)INTO MYCOUNT FROM VIEW77;SELECT COUNT(*)INTO MYCOUNT FROM VIEW43;CALL SP522(MYVAR);CALL SP197(MYVAR);CALL SP555(MYVAR);CALL SP161(MYVAR);END
GO
CREATE PROCEDURE SP502(OUT MYCOUNT INTEGER) SPECIFIC SP502_30645 LANGUAGE SQL NOT DETERMINISTIC READS SQL DATA NEW SAVEPOINT LEVEL BEGIN ATOMIC DECLARE MYVAR INT;SELECT COUNT(*)INTO MYCOUNT FROM TABLE246;SELECT COUNT(*)INTO MYCOUNT FROM TABLE398;SELECT COUNT(*)INTO MYCOUNT FROM TABLE73;SELECT COUNT(*)INTO MYCOUNT FROM VIEW52;SELECT COUNT(*)INTO MYCOUNT FROM VIEW33;SELECT COUNT(*)INTO MYCOUNT FROM VIEW72;END
GO
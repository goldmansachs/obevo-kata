CREATE PROCEDURE SP839(OUT MYCOUNT INTEGER) SPECIFIC SP839_52079 LANGUAGE SQL NOT DETERMINISTIC READS SQL DATA NEW SAVEPOINT LEVEL BEGIN ATOMIC DECLARE MYVAR INT;SELECT COUNT(*)INTO MYCOUNT FROM TABLE285;SELECT COUNT(*)INTO MYCOUNT FROM TABLE427;SELECT COUNT(*)INTO MYCOUNT FROM TABLE215;SELECT COUNT(*)INTO MYCOUNT FROM VIEW91;SELECT COUNT(*)INTO MYCOUNT FROM VIEW59;SELECT COUNT(*)INTO MYCOUNT FROM VIEW79;END
GO
CREATE PROCEDURE SP324(OUT MYCOUNT INTEGER) SPECIFIC SP324_25672 LANGUAGE SQL NOT DETERMINISTIC READS SQL DATA NEW SAVEPOINT LEVEL BEGIN ATOMIC DECLARE MYVAR INT;SELECT COUNT(*)INTO MYCOUNT FROM TABLE286;SELECT COUNT(*)INTO MYCOUNT FROM TABLE180;SELECT COUNT(*)INTO MYCOUNT FROM TABLE415;SELECT COUNT(*)INTO MYCOUNT FROM VIEW36;SELECT COUNT(*)INTO MYCOUNT FROM VIEW71;SELECT COUNT(*)INTO MYCOUNT FROM VIEW16;END
GO
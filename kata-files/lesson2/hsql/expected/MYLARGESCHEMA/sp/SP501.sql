CREATE PROCEDURE SP501(OUT MYCOUNT INTEGER) SPECIFIC SP501_82397 LANGUAGE SQL NOT DETERMINISTIC READS SQL DATA NEW SAVEPOINT LEVEL BEGIN ATOMIC DECLARE MYVAR INT;SELECT COUNT(*)INTO MYCOUNT FROM TABLE79;SELECT COUNT(*)INTO MYCOUNT FROM TABLE436;SELECT COUNT(*)INTO MYCOUNT FROM TABLE20;SELECT COUNT(*)INTO MYCOUNT FROM VIEW24;SELECT COUNT(*)INTO MYCOUNT FROM VIEW77;SELECT COUNT(*)INTO MYCOUNT FROM VIEW68;CALL SP972(MYVAR);CALL SP484(MYVAR);CALL SP69(MYVAR);CALL SP150(MYVAR);END
GO
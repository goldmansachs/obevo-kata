CREATE FUNCTION func150() RETURNS integer
    LANGUAGE plpgsql
    AS $$ DECLARE val INTEGER; BEGIN val:=(SELECT COUNT(*)INTO MYCOUNT FROM MYLARGESCHEMA.TABLE235);val:=(SELECT COUNT(*)INTO MYCOUNT FROM MYLARGESCHEMA.TABLE409);val:=(SELECT COUNT(*)INTO MYCOUNT FROM MYLARGESCHEMA.TABLE291);val:=(SELECT COUNT(*)INTO MYCOUNT FROM MYLARGESCHEMA.VIEW47);val:=(SELECT COUNT(*)INTO MYCOUNT FROM MYLARGESCHEMA.VIEW23);val:=(SELECT COUNT(*)INTO MYCOUNT FROM MYLARGESCHEMA.VIEW85);CALL FUNC717(MYVAR);CALL FUNC846(MYVAR);CALL FUNC739(MYVAR);CALL FUNC505(MYVAR);END $$;



GO
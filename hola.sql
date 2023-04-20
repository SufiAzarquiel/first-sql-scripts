SET SERVEROUTPUT ON
SET VERIFY OFF

ACCEPT N VARCHAR2 'Dime un número';
DECLARE
tamano NUMBER := &N;
espacios NUMBER(3);
str VARCHAR2(256) := CHR(9);
cambio NUMBER := 1;
BEGIN
  DBMS_OUTPUT.PUT_LINE('empieza');
  espacios := 0;
  LOOP
    str := CHR(9);
    IF espacios = tamano THEN
      cambio := -1;
    ELSE
      IF espacios = 0 THEN
        cambio := 1;
      END IF;
    END IF;
    espacios := espacios + cambio;
    FOR i IN 1..espacios LOOP
      str := str||' ';
    END LOOP;
    str := str||'*';
    DBMS_OUTPUT.PUT_LINE(str);
  END LOOP;
END;
/

SET SERVEROUTPUT OFF
SET VERIFY ON
SET SERVEROUTPUT ON
SET VERIFY OFF

ACCEPT N VARCHAR2 'Dime un número';
DECLARE
total NUMBER := &N;
str VARCHAR2(100) := '';
BEGIN
  FOR i IN 1..total LOOP
    str:='';
    -- Whitespaces
    FOR k IN 1..((total-i)) LOOP
      str:=str||' ';
    END LOOP;
    -- Asterisks
    FOR j IN 1..(2*i-1) LOOP
      str:=str||'*';
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(str);
  END LOOP;
END;
/

SET SERVEROUTPUT OFF
SET VERIFY ON
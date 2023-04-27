CREATE OR REPLACE PROCEDURE ZIGZAG(N IN NUMBER) IS
espacios NUMBER(3);
str VARCHAR2(256) := CHR(9);
cambio NUMBER := 1;
ca NUMBER := 0;
BEGIN
  DBMS_OUTPUT.PUT_LINE('empieza');
  espacios := 0;
  LOOP
    str := CHR(9);
    IF espacios = N THEN
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
    ca := ca + 1;
    EXIT WHEN ca > 200;
  END LOOP;
END;
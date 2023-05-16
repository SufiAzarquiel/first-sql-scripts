-- Dado un numero de horas, conviertelo en semanas, dias y horas
SET SERVEROUTPUT ON
SET VERIFY OFF

ACCEPT strIn NUMBER PROMPT 'Dime el numero de horas';
DECLARE
horas NUMBER := &strIn;
dias NUMBER;
semanas NUMBER;
newStr VARCHAR2(200);
BEGIN
  semanas := horas / (24 * 7);
  dias := horas MOD (24 * 7) / 24;
  horas := horas MOD 24;
  newStr := 'Semanas: ' || FLOOR(semanas) || ' Dias: ' || FLOOR(dias) || ' Horas: ' || FLOOR(horas);
  dbms_output.put_line(newStr);
END;
/

SET SERVEROUTPUT OFF
SET VERIFY ON
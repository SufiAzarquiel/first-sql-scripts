-- Dado un numero calcula la suma de sus digitos
SET SERVEROUTPUT ON
SET VERIFY OFF

ACCEPT strIn NUMBER PROMPT 'Dime un numero';
DECLARE
numero NUMBER := &strIn;
suma NUMBER := 0;
resultado VARCHAR2(100);
BEGIN
  WHILE numero > 0 LOOP
    suma := suma + MOD(numero,10);
    numero := numero / 10;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('La suma de los digitos es: ' || FLOOR(suma));
END;
/

SET SERVEROUTPUT OFF
SET VERIFY ON
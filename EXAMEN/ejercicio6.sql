-- Calcula si un año es bisiesto
/*
Año bisiesto es el divisible entre 4, salvo que sea año secular, último
de cada siglo, terminado en «00», en cuyo caso ha de ser divisible entre 400.
*/
SET SERVEROUTPUT ON
SET VERIFY OFF

ACCEPT strIn NUMBER PROMPT 'Dime que año es';
DECLARE
anio NUMBER := &strIn;
resultado VARCHAR2(100);
BEGIN
  IF anio MOD 4 = 0 AND anio MOD 100 != 0 THEN
    resultado := 'Es bisiesto';
  ELSIF anio MOD 100 = 0 AND anio MOD 400 = 0 THEN
    resultado := 'Es bisiesto';
  ELSE
    resultado := 'No es bisiesto';
  END IF;
  DBMS_OUTPUT.PUT_LINE(resultado);
END;
/

SET SERVEROUTPUT OFF
SET VERIFY ON
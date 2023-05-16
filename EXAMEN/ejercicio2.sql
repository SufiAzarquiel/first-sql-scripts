-- Dado un numero entero positivo, calcular si es primo o no.
SET SERVEROUTPUT ON
SET VERIFY OFF

ACCEPT strIn NUMBER PROMPT 'Dime un numero entero positivo';
DECLARE
numero NUMBER := &strIn;
resultado VARCHAR2(20);
BEGIN
  IF numero = 1 THEN
    resultado := 'No es primo';
  ELSIF numero = 2 THEN
    resultado := 'El numero es primo';
  ELSE
    FOR i IN 2..numero-1 LOOP
        IF MOD(numero, i) = 0 THEN
            resultado := 'No es primo';
            EXIT;
        ELSE
            resultado := 'El numero es primo';
        END IF;
    END LOOP;
  END IF;
  dbms_output.put_line(resultado);
END;
/

SET SERVEROUTPUT OFF
SET VERIFY ON
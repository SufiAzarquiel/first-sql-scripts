-- Calcular retencion irpf segun nomina
/*
De 0 hasta 12.450€ 19%
De 12.450 hasta 20.200€ 24%
De 20.200 hasta 35.200€ 30%
De 35.200 hasta 60.000€ 37%
*/
SET SERVEROUTPUT ON
SET VERIFY OFF

ACCEPT strIn VARCHAR2(100) PROMPT 'Dime cuanto es tu nomina';
DECLARE
nomina NUMBER := &strIn;
resultado VARCHAR2(100);
BEGIN
  IF nomina < 12450 THEN
    resultado:= 'Tu nomina despues del descuento es'||nomina*(1 - 0.19);
 ELSIF nomina < 20200 THEN
    resultado:= 'Tu nomina despues del descuento es'||nomina*(1 - 0.24);
ELSIF nomina < 35200 THEN
    resultado:= 'Tu nomina despues del descuento es'||nomina*(1 - 0.30);
ELSIF nomina < 60000 THEN
    resultado:= 'Tu nomina despues del descuento es'||nomina*(1 - 0.37);
END IF;
    DBMS_OUTPUT.PUT_LINE(resultado);
END;
/

SET SERVEROUTPUT OFF
SET VERIFY ON
-- ESCRIBE UNA NOTA, DETERMINA SI ES INSUFICIENTE...
-- <5 INS, 5 SUF, 6 BIEN, 7-8 NOTABLE, 9-10 SOBRESALIENTE
SET SERVEROUTPUT ON
SET VERIFY OFF

ACCEPT N VARCHAR2 'Dime un n�mero';
DECLARE
notaFloat NUMBER(5, 3) := &N;
notaStr VARCHAR2(100) := '';
BEGIN
  IF notaFloat >= 0 AND notaFloat < 5 THEN
    notaStr := 'Insuficiente';
  ELSIF notaFloat < 6 THEN
    notaStr := 'Suficiente';
  ELSIF notaFloat < 7 THEN
    notaStr := 'Bien';
  ELSIF notaFloat < 8 THEN
    notaStr := 'Notable';
  ELSIF notaFloat <= 10 THEN
    notaStr := 'Sobresaliente';
  ELSE
    notaStr := 'Algo has puesto mal, pon un numero del 0 al 10 crack';
  END IF;
  DBMS_OUTPUT.PUT_LINE(notaStr);
END;
/

SET SERVEROUTPUT OFF
SET VERIFY ON
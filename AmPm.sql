-- De AM-PM a 24h
SET SERVEROUTPUT ON
SET VERIFY OFF

ACCEPT minutos NUMBER PROMPT 'Dime el minuto actual';
ACCEPT horas NUMBER PROMPT 'Dime la hora';
ACCEPT ampm VARCHAR2(3) PROMPT 'De la tarde o la mañana? (Escribe am o pm)';
DECLARE
hora NUMBER := &horas;
minuto NUMBER := &minutos;
tiempo VARCHAR2(3) := '&ampm';
horaFinal VARCHAR2(20) := '';
BEGIN
  IF tiempo = 'pm' THEN
    horaFinal := horaFinal||(hora + 12)||':'||minuto;
  ELSIF tiempo = 'am' THEN
    horaFinal := horaFinal||hora||':'|| minuto;
  END IF;
  DBMS_OUTPUT.PUT_LINE(horafinal);
END;
/

SET SERVEROUTPUT OFF
SET VERIFY ON
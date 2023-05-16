-- Area de un circulo dado el radio
SET SERVEROUTPUT ON
SET VERIFY OFF

ACCEPT strIn NUMBER PROMPT 'Dame el radio del circulo';
DECLARE
radio NUMBER := &strIn;
resultado VARCHAR2(50);
BEGIN
  resultado := 'El area es: ' || (3.1416 * radio * radio);
  dbms_output.put_line(resultado);
END;
/

SET SERVEROUTPUT OFF
SET VERIFY ON
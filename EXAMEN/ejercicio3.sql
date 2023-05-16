-- Dados 3 numeros a, b y c calcular la solucion de la ecuacion de segundo grado
SET SERVEROUTPUT ON
SET VERIFY OFF

ACCEPT strIn1 NUMBER PROMPT 'Introduce a';
ACCEPT strIn2 NUMBER PROMPT 'Introduce b';
ACCEPT strIn3 NUMBER PROMPT 'Introduce c';
DECLARE
numeroA NUMBER := &strIn1;
numeroB NUMBER := &strIn2;
numeroC NUMBER := &strIn3;
resultado NUMBER;
newStr VARCHAR2(10);
BEGIN
  resultado := (-1 * numeroB + SQRT(numeroB * numeroB - 4 * numeroA * numeroC)) / (2 * numeroA);
  dbms_output.put_line('X es igual a: '||resultado);
END;
/

SET SERVEROUTPUT OFF
SET VERIFY ON
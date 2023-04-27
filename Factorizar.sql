-- Given n (62) return its prime factors i.e. 2, 2, 3 etc
-- Also gcd
SET SERVEROUTPUT ON
SET VERIFY OFF

ACCEPT strIn PROMPT 'Introduce un numero';
DECLARE
N NUMBER := '&strIn';
divisor NUMBER := 2;
resultado VARCHAR2(32767);
BEGIN
  WHILE (divisor < N or divisor = N) LOOP
    IF MOD(N, divisor) = 0 THEN
      resultado := resultado ||' '||divisor;
      N := N / divisor;
    ELSE
      divisor := divisor + 1;
    END IF;
  END LOOP;
  dbms_output.put_line(SUBSTR(resultado, 2));
END;
/

SET SERVEROUTPUT OFF
SET VERIFY ON
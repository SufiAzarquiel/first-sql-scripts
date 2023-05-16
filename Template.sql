-- Input Output Template
SET SERVEROUTPUT ON
SET VERIFY OFF

ACCEPT strIn VARCHAR2(3) PROMPT 'Enter a string';
DECLARE
str VARCHAR2(10) := '&strIn';
resultado VARCHAR2(100);
BEGIN
  newStr := SUBSTR(str, 3, 2);
  dbms_output.put_line(newStr);
END;
/

SET SERVEROUTPUT OFF
SET VERIFY ON
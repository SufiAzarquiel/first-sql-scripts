CREATE OR REPLACE PROCEDURE bmSufi AS
  numBombas NUMBER;
  TYPE TVECTOR IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;
  V TVECTOR;
BEGIN
  FOR i IN 1..100 LOOP
    numBombas := FLOOR(DBMS_RANDOM.VALUE(0,2));
    DBMS_OUTPUT.PUT_LINE(numBombas);
  END LOOP;
END;
/
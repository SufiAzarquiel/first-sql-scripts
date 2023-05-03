CREATE OR REPLACE PROCEDURE showLineaSufi(linea IN NUMBER) AS
  ESTACION_INICIAL ESTACION.NOMBRE%TYPE;
  ESTACION_FINAL ESTACION.NOMBRE%TYPE;
  NOMBREESTACION ESTACION.NOMBRE%TYPE;
  -- otros lenguajes usan resultset
  CURSOR CE IS SELECT NESTACION, ORDEN FROM LE WHERE NLINEA = linea ORDER BY ORDEN;
BEGIN
  -- mostrar estacion inicial y final
  SELECT NOMBRE INTO ESTACION_INICIAL FROM ESTACION WHERE NESTACION = (
    SELECT EINI FROM LINEA WHERE NLINEA = linea
  );
  SELECT NOMBRE INTO ESTACION_FINAL FROM ESTACION WHERE NESTACION = (
    SELECT EFIN FROM LINEA WHERE NLINEA = linea
  );
  DBMS_OUTPUT.PUT_LINE('Linea: '||linea);
  DBMS_OUTPUT.PUT_LINE('Estacion inicial: '||ESTACION_INICIAL);
  DBMS_OUTPUT.PUT_LINE('Estacion final: '||ESTACION_FINAL);

  -- mostrar estaciones intermedias
  FOR E IN CE LOOP
    SELECT NOMBRE INTO NOMBREESTACION FROM ESTACION WHERE NESTACION = E.NESTACION;
    DBMS_OUTPUT.PUT_LINE(E.ORDEN||' - '||NOMBREESTACION);
  END LOOP;
END;
/
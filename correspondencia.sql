CREATE OR REPLACE PROCEDURE correspondenciaSufi(linea IN NUMBER) AS
  ESTACION_INICIAL ESTACION.NOMBRE%TYPE;
  ESTACION_FINAL ESTACION.NOMBRE%TYPE;
  NOMBREESTACION ESTACION.NOMBRE%TYPE;
  LINEASTR VARCHAR2(100);
  RESULTADO VARCHAR2(100);
  TOTAL BINARY_INTEGER;
  -- otros lenguajes usan resultset
  CURSOR CE IS SELECT NESTACION, ORDEN FROM LE WHERE NLINEA = linea ORDER BY ORDEN;
  CURSOR CORR(NE ESTACION.NESTACION%TYPE) IS SELECT NLINEA FROM LE WHERE NESTACION = NE AND NLINEA != linea;
BEGIN
  -- mostrar estacion inicial y final
  SELECT NOMBRE INTO ESTACION_INICIAL FROM ESTACION WHERE NESTACION = (
    SELECT EINI FROM LINEA WHERE NLINEA = linea
  );
  SELECT NOMBRE INTO ESTACION_FINAL FROM ESTACION WHERE NESTACION = (
    SELECT EFIN FROM LINEA WHERE NLINEA = linea
  );
  LINEASTR := 'Linea: '||linea||' - '||ESTACION_INICIAL||' - '||ESTACION_FINAL;
  DBMS_OUTPUT.PUT_LINE(LINEASTR);
  DBMS_OUTPUT.PUT_LINE(LPAD('-', LENGTH(LINEASTR), '-'));

  -- mostrar estaciones intermedias
  DBMS_OUTPUT.PUT_LINE('Estaciones de la linea:');
  FOR E IN CE LOOP
    SELECT NOMBRE INTO NOMBREESTACION FROM ESTACION WHERE NESTACION = E.NESTACION;
    DBMS_OUTPUT.PUT_LINE(E.ORDEN||' - '||NOMBREESTACION);
    RESULTADO := '';
    SELECT COUNT(*) INTO TOTAL FROM LE WHERE NESTACION = E.NESTACION AND NLINEA != linea;
    IF TOTAL > 0 THEN
        FOR CO IN CORR(E.NESTACION) LOOP
            RESULTADO := RESULTADO||CO.NLINEA||' ';
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('Corresponde a las lineas: '||RESULTADO);
    END IF;
  END LOOP;
END;
/
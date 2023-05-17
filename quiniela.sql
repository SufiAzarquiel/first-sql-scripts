CREATE OR REPLACE PROCEDURE quinielaSufi(temporada_in IN TEMPORADA.CODTEMP%TYPE, jornada_in IN PARTIDO.JORNADA%TYPE) AS
  nombre_eL EQUIPO.NOMBRE%TYPE;
  nombre_eV EQUIPO.NOMBRE%TYPE;
  goles_eL PARTIDO.GOLESLOCAL%TYPE;
  goles_eV PARTIDO.GOLESVISITANTE%TYPE;
  linea_partido VARCHAR2(100);
  -- otros lenguajes usan resultset
  CURSOR PC IS SELECT * FROM PARTIDO WHERE TEMPORADA = temporada_in AND JORNADA = jornada_in;
BEGIN
  DBMS_OUTPUT.PUT_LINE(CHR(9)||RPAD('LOCAL', 25, ' ')||RPAD('VISITANTE', 25, ' ')||'RESULTADO');
  DBMS_OUTPUT.PUT_LINE(CHR(9));
  FOR ROW_C IN PC LOOP
    SELECT NOMBRE INTO nombre_eL FROM EQUIPO WHERE CODEQUIPO = ROW_C.LOCAL;
    SELECT NOMBRE INTO nombre_eV FROM EQUIPO WHERE CODEQUIPO = ROW_C.VISITANTE;

    linea_partido := CHR(9)||RPAD(nombre_eL, 25, ' ')||RPAD(nombre_eV, 25, ' ');

    IF ROW_C.GOLESLOCAL > ROW_C.GOLESVISITANTE THEN
        linea_partido := linea_partido|| '1      ';
    ELSIF ROW_C.GOLESLOCAL < ROW_C.GOLESVISITANTE THEN
        linea_partido := linea_partido|| '      2';
    ELSE
        linea_partido := linea_partido|| '   X   ';
    END IF;

    DBMS_OUTPUT.PUT_LINE(linea_partido);
  END LOOP;
END;
/
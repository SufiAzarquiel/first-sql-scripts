SELECT NOMBRE FROM ESTACION WHERE NESTACION = (
    SELECT EFIN FROM LINEA WHERE NLINEA = 9
  );
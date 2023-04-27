SET SERVEROUTPUT ON
SET VERIFY OFF 
ACCEPT cifra PROMPT 'Dime un numero de segundos : '
DECLARE
  cifra NUMBER(6):='&cifra';
  horas NUMBER(3);
  minutos NUMBER(2);
  segundos NUMBER(2);
BEGIN
  -- de la cifra de segundos inicial calculamos las horas
  horas:= trunc(cifra / 3600);
  -- calculamos los segundos que nos quedan
  -- despues de quitar las horas.
  -- Los volvemos a meter en la variable cifra 
  cifra:= MOD(cifra, 3600);
  -- de estos restantes sacamos los minutos
  minutos := trunc(cifra / 60);
  -- el resto despues de sacar minutos son los segundos finales
  -- MOD lo podéis utilizar en forma de funcion o en forma de operador
  segundos:= cifra MOD 60;
  DBMS_OUTPUT.PUT_LINE(horas || ':' || minutos || ':' || segundos);
END;
/
SET SERVEROUTPUT OFF
SET VERIFY ON
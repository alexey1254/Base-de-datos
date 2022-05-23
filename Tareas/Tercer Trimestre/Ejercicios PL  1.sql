# Ejercicio
1

DROP PROCEDURE IF EXISTS suma;

delimiter //
CREATE PROCEDURE suma(
    in numero1 int,
    in numero2 int,
    out salida;
)
begin
    set salida
    = numero1 + numero2;
end //
delimiter ;

call suma
(4,4,@resultado);
SELECT @resultado;

# Ejercicio 2

DROP PROCEDURE IF EXISTS cadenaReversa;

delimiter //
CREATE PROCEDURE cadenaReversa(
    in cadena VARCHAR
(255),
    out salida VARCHAR
(255)
)
begin
    set salida
    = REVERSE
    (cadena);
end //

delimiter ;

# Ejercicio 3

DROP PROCEDURE IF EXISTS getAnio;

delimiter //
CREATE procedure getAnio(
    in fecha date,
    out salida int
)
begin
    set fecha
    = YEAR
    (fecha);
end //
delimiter ;

call getAnio
("2020-06-21", @anio);

# Ejercicio 4



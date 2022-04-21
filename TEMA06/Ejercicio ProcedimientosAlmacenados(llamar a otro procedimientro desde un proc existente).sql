# Escribir un procedimiento que reciba dos números y visualice su suma.

DROP PROCEDURE IF EXISTS suma;

delimiter //
create procedure suma(
    in numero1 int,
    in numero2 int,
    out salida int
)
begin
    set salida = numero1 + numero2;
end //
delimiter ;

call suma(5,5,@resultado);
SELECT @resultado;

# Codificar un procedimiento que reciba una cadena y la visualice al revés.

DROP PROCEDURE IF EXISTS cadenaReversa;

delimiter //
CREATE procedure cadenaReversa(
    in cadena VARCHAR(255),
    out salida VARCHAR(255)
)
begin
    set salida = REVERSE(cadena);
end //
delimiter ;

call cadenaReversa("paella",@reversa);
SELECT @reversa;

# Escribir una función que reciba una fecha y devuelva el año, en número, correspondiente a esa fecha

DROP PROCEDURE IF EXISTS getAnio;

delimiter //
CREATE procedure getAnio(
    in fecha date,
    out salida int
)
begin
    set fecha = YEAR(fecha);
end //
delimiter ;

call getAnio("2020-06-21", @anio);


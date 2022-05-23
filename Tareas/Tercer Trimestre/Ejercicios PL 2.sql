# Ejercicio 1



# Desarrollar una función que devuelva el número de años completos que hay entre dos fechas que se pasan como argumentos.

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

# Escribir una función que, haciendo uso de la función anterior devuelva los trienios que hay entre dos fechas. (Un trienio son tres años completos).




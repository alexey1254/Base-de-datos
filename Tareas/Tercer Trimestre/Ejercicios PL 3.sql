# Codificar un procedimiento que reciba una lista de hasta 5 numeros y visualice su suma

DROP PROCEDURE IF EXISTS suma;

delimiter //
CREATE PROCEDURE suma(
    in numero1 int,
    in numero2 int,
    in numero3 int,
    in numero4 int,
    in numero5 int,
    out resultado int
)

begin
    set resultado = numero1 + numero2 + numero3 + numero4 + numero5;
end //

delimiter ;

call suma(1,2,3,4,5 ,@resultado);
SELECT @resultado;

# Escribir una funcion que devuelva solamente caracteres alfabéticos sustituyendo cualquier otro caracter por blancos a partir de una cadena que se pasara en la llamada

DROP PROCEDURE IF EXISTS soloAlfabeticos;

delimiter //
CREATE PROCEDURE soloAlfabeticos(
    in cadena VARCHAR(255),
    out salida VARCHAR(255)
)
begin
    set
end //

delimiter ;

# Implementar un procedimiento que reciba un importe y visualice el desglose del cambio en unidades monetarias de 1, 5, 10, 25, 50, 100, 200, 500, 1000, 2000, 5000 Ptas. en orden inverso al que aparecen aquí enumeradas.



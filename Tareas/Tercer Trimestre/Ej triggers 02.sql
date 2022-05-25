/* 4) Crear un Trigger para controlar la inserción de empleados, cuando insertemos un empleado se copiarán datos sobre la inserción en una tabla llamada 
Control_BD. Los datos que se copiarán son el Número de empleado, El usuario que está realizando la operación, la fecha y el tipo de operación. */

CREATE TABLE ControlBD (
	Emp_No INT NOT NULL,
	Usuario VARCHAR(50) NULL,
    Fecha_Mod DATE NULL,
    Operacion VARCHAR(20) NULL
    );

drop trigger if exists controlInsercionEmpleados;
DELIMITER //

create trigger controlInsercionEmpleados
    after insert
    on Emp
    for each row
BEGIN
    INSERT INTO ControlBD(Emp_No,Usuario,Fecha_Mod,Operacion) VALUES(new.Emp_No,USER(),CURRENT_DATE(),'Insercion');
end //
DELIMITER ;

# 5) Crear un Trigger que actue cuando se modifique la tabla hospital y sobre todas las tablas con las que esté relacionadas.




/* 6) Crear un Trigger en la tabla plantilla. Cuando actualicemos la tabla plantilla, debemos comprobar que el hospital que actualizamos existe, 
si intentamos actualizar el código de hospital, no podremos hacerlo si no existe 
relación con algún código de hospital. Realizar el mismo Trigger para las tablas relacionadas con Hospital.
*/


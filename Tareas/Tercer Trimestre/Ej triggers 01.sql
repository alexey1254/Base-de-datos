

# 1) Crear un Trigger que borre en cascada sobre la tabla relacionada cuando borremos una sala. Mostrar el registro borrado al ejecutar el Trigger.

DELIMITER //
create trigger borradoCascada
    before delete
    on Sala
    for each row
BEGIN
    DELETE FROM Plantilla WHERE Plantilla.Sala_Cod=old.Sala_Cod;
end //

DELIMITER ;


# 2) Crear un Trigger que se active cuando Actualicemos alguna sala del hospital, modificando sus tablas relacionadas. Mostrar el registro Actualizado. 

DELIMITER 

create trigger update_sala
    before update_sala
    on Sala
    for each row
BEGIN
    UPDATE Plantilla SET Plantilla.Sala_Cod=new.Sala_Cod WHERE Plantilla.Sala_Cod=old.Sala_Cod;
end //

DELIMITER ;


# 3) Crear un Trigger que se active al eliminar un registro en la tabla hospital y modifique las tablas correspondientes.

DELIMITER //
create trigger deleteHospital
    after delete
    on hospital
    for each row
BEGIN
    DELETE FROM Plantilla WHERE Plantilla.Hospital_Cod=old.Hospital_Cod;
    DELETE FROM Doctor WHERE Doctor.Hospital_Cod=old.Hospital_Cod;
    DELETE FROM Sala WHERE Sala.Hospital_Cod=old.Hospital_Cod;
end //
DELIMITER ;



# 1) Crear un Trigger que borre en cascada sobre la tabla relacionada cuando borremos una sala. Mostrar el registro borrado al ejecutar el Trigger.

DELIMITER //
create trigger borradoCascada
    before delete
    on Sala
    for each row
BEGIN
    
end //

DELIMITER ;


# 2) Crear un Trigger que se active cuando Actualicemos alguna sala del hospital, modificando sus tablas relacionadas. Mostrar el registro Actualizado. 



# 3) Crear un Trigger que se active al eliminar un registro en la tabla hospital y modifique las tablas correspondientes.



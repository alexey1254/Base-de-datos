CREATE TABLE secciones (
    codigo int(10) zerofill NOT NULL PRIMARY KEY  AUTO_INCREMENT ,
    nombre varchar(30),
    sueldo decimal(5,2)
);

insert into secciones (nombre,sueldo) values 

("Administracion",300),
("Contaduria",400),
("Sistemas",500);

CREATE TABLE empleados (
    legajo int(10) zerofill NOT NULL PRIMARY KEY AUTO_INCREMENT,
    documento char(8),
    sexo char(1),
    apellido varchar(40),
    nombre varchar(30),
    domicilio varchar(30),
    seccion int NOT NULL,
    cantidadhijos int,
    estadocivil char(10),
    fechaingreso date
);

insert into empleados values 
(1,"222","f","Lopez","Ana","Colon 123", 1, 2, "casado",1990-10-10);


# Creamos una vista de la combinacion de 3 campos
DROP VIEW IF EXISTS vista_empleados;
CREATE VIEW vista_empleados as
    select nombre as empleado, apellido, seccion from empleados;


# Creamos otra vista empleados que almacena la cantidad de empleados por año
DROP VIEW IF EXISTS vista_empleados_ingreso;
create view vista_empleados_ingreso(fecingreso,cantidad) as
    select  extract(year from fechaingreso) as fecingreso,
    count(*) as cantidad
    from empleados
    group by fecingreso;
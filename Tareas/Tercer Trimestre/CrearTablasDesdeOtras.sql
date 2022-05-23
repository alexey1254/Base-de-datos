# Tenemos las tablas "libros" y "editoriales" y queremos crear una tabla llamada
#  "cantidadporeditorial" que contenga la cantidad de libros de cada editorial.

DROP TABLE IF EXISTS libros;
CREATE TABLE libros (
    codigo int unsigned AUTO_INCREMENT,
    titulo varchar(40) not null,
    autor varchar(30) not null default 'Desconocido',
    codigoeditorial tinyint unsigned,
    precio decimal(5,2) unsigned,
    primary key (codigo)
);

DROP TABLE IF EXISTS editoriales 
CREATE TABLE EDITORIALES (
    codigo tinyint unsigned AUTO_INCREMENT,
    nombre varchar(20),
    primary key (codigo)
);


# Ingresamos algunos registros

insert into editoriales (nombre) values('Emece');
insert into editoriales (nombre) values('Planeta');
insert into editoriales (nombre) values('Paidos');

insert into libros values (1,'El aleph','Borges',1,23.5);
insert into libros values (2,'Alicia en el pais de las maravillas',
                        'Lewis Carroll',2,15);
insert into libros values (3,'Matematica estas ahi','Paenza',1,34.6);
insert into libros values (4,'Martin Fierro','Jose Hernandez',3,43.5);
insert into libros values (5,'Martin Fierro','Jose Hernandez',2,12);
insert into libros values (6,'Aprenda PHP','Mario Molina',3,21.8);
insert into libros values (7,'Aprenda Java','Mario Molina',3,55.4);
insert into libros values (8,'Alicia a traves del espejo','Lewis Carroll',1,18);
insert into libros values (9,'Antologia poetica','Borges',3,47.9);

# Ahora crearemos una tabla que nos diga la cantidad de libros por editorial
# Pero la creamos a partir de otra tabla

DROP TABLE IF EXISTS cantidadporeditorial;
CREATE TABLE cantidadporeditorial 
    select e.nombre,count(*) as cantidad from libros as l
    JOIN editoriales as e on l.codigoeditorial=e.codigo
    group by e.nombre;

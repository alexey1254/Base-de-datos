# Insertar datos en una tabla buscando
# un valor en otra
# Queremos ingresar en "libros", el siguiente
# libro: Harry Potter y la piedra filosofal,
# J.K. Rowling, Emece, 45.90.
# pero no recordamos el código de la editorial "Emece".

drop tables if exists libros, editoriales;

create table libros(
    codigo int unsigned auto_increment,
    titulo varchar(40) not null,
    autor varchar(30),
    codigoeditorial tinyint unsigned,
    precio decimal(5,2) unsigned,
    primary key (codigo)
);

create table editoriales(
    codigo tinyint unsigned auto_increment,
    nombre varchar(20),
    domicilio varchar(30),
    primary key(codigo)
);

insert into libros values (1,'El aleph','Borges',2,23.5);
insert into libros values (2,'Alicia en el pais de las maravillas','Lewis Carroll',1,15);
insert into libros values (3,'Matematica estas ahi','Paenza',2,34.6);
insert into libros values (4,'Martin Fierro','Jose Hernandez',3,43.5);
insert into libros values (5,'Martin Fierro','Jose Hernandez',2,12);

insert into editoriales values(1,'Planeta','San Martin 222');
insert into editoriales values(2,'Emece','San Martin 590');
insert into editoriales values(3,'Paidos','Colon 245');

# Aqui hacemos el insert

insert into libros (titulo, autor, codigoeditorial, precio)
select 'Harry Potter y la camara secreta','J.K.Rowling',codigo,45.90
from editoriales where nombre='Emece';

# En realidad estas haciendo select codigo from editoriales

insert into libros (titulo, autor, codigoeditorial,precio)
select 'Harry Potter y el viento pepe','J.K.Rowling',codigo,45.95
from editoriales where nombre='Planeta';
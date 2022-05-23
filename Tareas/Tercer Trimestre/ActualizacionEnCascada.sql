# Update join

drop table if exists libros, editoriales;

create table libros(
codigo int unsigned auto_increment,
titulo varchar(40),
autor varchar(30),
codigoeditorial tinyint unsigned,
primary key(codigo)
);

create table editoriales(
codigo tinyint unsigned auto_increment,
nombre varchar(20),
primary key(codigo)
);

insert into editoriales values(1,'Planeta');
insert into editoriales values(2,'Emece');
insert into editoriales values(3,'Paidos');

insert into libros values (1,'El aleph','Borges',2);
insert into libros values (2,'Alicia en el pais de las maravillas','Lewis Carroll',1);
insert into libros values (3,'Matematica estas ahi','Paenza',2);
insert into libros values (4,'Martin Fierro','Jose Hernandez',3);
insert into libros values (5,'Martin Fierro','Jose Hernandez',2);

# Queremos modificar el código de la editorial "Emece" a "9" y también todos los 
# "codigoeditorial" de los libros de dicha editorial: 

# Se puede hacer de dos maneras:

update editoriales
set codigo=9
where nombre='Emece';

update libros
set codigoeditorial=9
where codigoeditorial=2;

# Segunda manera:

update libros as l
join editoriales as e
on l.codigoeditorial=e.codigo
set l.codigoeditorial=9, e.codigo=9
where e.nombre='Emece';
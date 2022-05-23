# Borrar registros en cascada

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

# La libreria ya no trabaja con la editorial
# emece, entonces quiere eliminar dicha editorial
# de la tabla editoriales y todos los libros de esta editorial

# Se puede hacer de dos maneras:

select @valor:= codigo from editoriales
where nombre='Emece';

delete editoriales where codigo=@valor;

delete libros where codigoeditorial =@valor;

# O de la siguiente manera:

delete libros, editoriales
from libros join editoriales
on libros.codigoeditorial=editoriales.codigo 
where editoriales.nombre='Emece';


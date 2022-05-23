# Actualizar datos con valores de otras tablas

# Tenemos la tabla "libros" en la cual almacenamos los 
# datos de los libros de nuestra biblioteca y la tabla "editoriales"
# que almacena el nombre de las distintas editoriales y sus códigos.

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

# Generamos un nuevo campo en la tabla libros

alter table libros add editorial varchar(30);

# Los campos generados estan todos NULL
# Para eso hacemos el update ->

update libros
join editoriales on libros.codigoeditorial=editoriales.codigo
set libros.editorial=editoriales.nombre;
CREATE DATABASE prueba;

DROP TABLE IF EXISTS clientes;
CREATE TABLE clientes (
    codigo int unsigned PRIMARY KEY auto_increment,
    nombre varchar(30) NOT NULL,
    domicilio varchar(30),
    ciudad varchar(20),
    codigoprovincia tinyint unsigned,
    telefono varchar(11)
);


DROP TABLE IF EXISTS provincias;
CREATE TABLE provincias (
    codigo tinyint unsigned PRIMARY KEY,
    nombre varchar(20)
);

ALTER TABLE clientes ADD 
FOREIGN KEY (codigoprovincia) REFERENCES provincias(codigo);

INSERT INTO clientes VALUES (1,'Lopez Marcos','Colon 111','Cordoba',1,NULL);
INSERT INTO clientes VALUES (2,'Perez Ana','San Martin 222','Cruz del Eje',1,'4578585');
INSERT INTO clientes VALUES (3,'Garcia Juan','Rivadavia 333','Villa Maria',1,'4578445');
INSERT INTO clientes VALUES (4,'Perez Luis','Sarmineto 444','Rosario',2,NULL);
INSERT INTO clientes VALUES (5,'Pereyra Lucas','San Martin 555','Cruz del Eje',1,'4253685');
INSERT INTO clientes VALUES (6,'Gomez Ines','San Martin 666','Santa Fe',2,'0345252525');
INSERT INTO clientes VALUES (7,'Torres Fabiola','Alem 777','Villa del Rosario',1,'4554455');
INSERT INTO clientes VALUES (8,'Lopez Carlos','Irigoyen 888','Cruz del Eje',1,NULL);
INSERT INTO clientes VALUES (9,'Ramos Betina','San Martin 999','Cordoba',1,'4223366');
INSERT INTO clientes VALUES (10,'Lopez Lucas','San Martin 1010','Posadas',4,'0457858745');

INSERT INTO provincias VALUES (1,'Cordoba');
INSERT INTO provincias VALUES (2,'Santa Fe');
INSERT INTO provincias VALUES (3,'Corrientes');
INSERT INTO provincias VALUES (4,'Misiones');
INSERT INTO provincias VALUES (5,'Salta');
INSERT INTO provincias VALUES (6,'Buenos Aires');
INSERT INTO provincias VALUES (7,'Neuquen');




DROP PROCEDURE IF EXISTS pa_masCantidadClientes;

DELIMITER //
CREATE PROCEDURE pa_masCantidadClientes(IN nomProvincia1 VARCHAR(20), IN nomProvincia2 VARCHAR(20))
BEGIN
    DECLARE canti1, canti2 INT;
    
    SELECT COUNT(c.codigo) INTO canti1
    FROM clientes c, provincias p 
    WHERE c.codigoprovincia = p.codigo AND p.nombre = nomProvincia1;

    SELECT COUNT(c.codigo) INTO canti2
    FROM clientes c, provincias p 
    WHERE c.codigoprovincia = p.codigo AND p.nombre = nomProvincia2;
    
    IF canti1 > canti2 THEN
        SELECT nomProvincia1 AS Provincia,canti1 AS Clientes;
    ELSEIF canti1 < canti2 THEN
        SELECT nomProvincia2 AS Provincia,canti2 AS Clientes;
    ELSE
        SELECT nomProvincia1 AS Provincia1,nomProvincia2 AS Provincia2,canti1 AS Clientes;
    END IF;
END //
DELIMITER ;
/*
4.-
*/
CALL pa_masCantidadClientes('Neuquen','Corrientes');
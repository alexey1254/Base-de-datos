# Las entidades se convierten en tablas 
## Ejercicio 1 ER (Nivel 1)

- Cliente (dni, nombre, telefono, apellidos)
- Producto (codigo producto, nombre, precio,nif(FK))
- Proveedores (NIF, nombre, dirección)
- Compra (dni, cliente (Se convierte en tabla por ser relacion N:M))
---------------------------------------------------------------------

## Ejercicio 2 ER (Nivel 1)


- Caso 1:
  - Si ambas entidades tienen cardinalidad (0,1) la relacion genera una tabla
- Caso 2:
  - Si una entidad posee cardinalidad (0,1) y la otra (1,1) se propaga de la entidad de (1,1) a la de (0,1).
- Caso 3:
  - Si ambas tienen cardinalidad (1,1) Se propaga de una a otra, da igual a cual.
---------------------------------------------------------------------
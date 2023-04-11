DROP DATABASE IF EXISTS tiendaInformatica;

CREATE DATABASE TiendaInformatica;
USE tiendaInformatica;
/*DROP TABLE IF EXISTS compra;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS articulo;
*/
CREATE TABLE cliente (
   CodCliente  char(3),
   nombreC varchar(40) not null,
   direccion varchar(40) not null,
   telefono  numeric(9,0),
   PRIMARY KEY(CodCliente)
);

CREATE TABLE articulo (
   codArticulo  char(4),
   denom    varchar(40) not null,
   precio    numeric(6,2) not null,
   unidades    integer,
   descuento numeric(5,2) DEFAULT 0,
   precioFinal numeric(7,2) DEFAULT (PRECIO-PRECIO*(DESCUENTO/100)),
      PRIMARY KEY(codArticulo)
);

CREATE TABLE compra (
   idCliente     char(3),
   idArticulo     char(4),
   fecCompra  date  NOT NULL,
   numUnidades   integer check( numUnidades >0),
   PRIMARY KEY(idCliente, idArticulo,fecCompra),
   FOREIGN KEY(idCliente) REFERENCES cliente(CodCliente) ON DELETE cascade,   
   FOREIGN KEY(idArticulo) REFERENCES articulo(codArticulo) ON DELETE cascade
   );



INSERT INTO cliente VALUES ('008', 'Torcuato Montero', 'Rio  Duero 14', 937846308);
INSERT INTO cliente VALUES ('009', 'Asuncion Rodríguez', 'Pez 14', 914565308);
INSERT INTO cliente VALUES ('010', 'Eustquia Alonso', 'Rio Lozoya 35', 917845208);
INSERT INTO cliente VALUES ('011', 'Angela Callejo',  'Pedro Villar 330',  914849303);
INSERT INTO cliente VALUES ('012', 'Maribel Riocal',  'Luna 11', 914394943);
INSERT INTO cliente VALUES ('013', 'Juan Antonio Sanz', 'Clavel 21',      915656501);
INSERT INTO cliente VALUES ('014', 'Clara Garcia', 'Cercona 57', 913389307);
INSERT INTO cliente VALUES ('015', 'Isabel Sanrio', 'Travesia del rio 14', 917845308);
INSERT INTO cliente VALUES ('016', 'Eugenio Arribas', 'Tinajas 14', 917845308);

INSERT INTO articulo(codArticulo, denom,precio,unidades) VALUES ('0001', 'Ordenador Sobremesa',     600, 12);
INSERT INTO articulo(codArticulo, denom,precio,unidades) VALUES ('0002', 'Ordenador Portátil',     1000,  6);
INSERT INTO articulo(codArticulo, denom,precio,unidades) VALUES ('0003', 'Tarjeta Red',         20, 25);
INSERT INTO articulo(codArticulo, denom,precio,unidades) VALUES ('0004', 'Impresora Láser',    200,  4);
INSERT INTO articulo(codArticulo, denom,precio,unidades) VALUES ('0005', 'Ratón USB',            7, 50);
INSERT INTO articulo(codArticulo, denom,precio,unidades) VALUES ('0006', 'Monitor TFT',        250, 10);
INSERT INTO articulo(codArticulo, denom,precio,unidades) VALUES ('0007', 'Router inalámbrico', 100, 30);
INSERT INTO articulo(codArticulo, denom,precio,unidades) VALUES ('0008', 'altavoz', 100,30);


INSERT INTO compra VALUES('011', '0001', '2016/10/06', 1);
INSERT INTO compra VALUES('011', '0005', '2017/10/06', 2);
INSERT INTO compra VALUES('012', '0002', '2019/11/06', 1);
INSERT INTO compra VALUES('012', '0003', '2018/11/06', 3);
INSERT INTO compra VALUES('012', '0001', '2018/11/06', 3);
INSERT INTO compra VALUES('012', '0004', '2018/11/06', 3);
INSERT INTO compra VALUES('012', '0005', '2018/11/06', 3);
INSERT INTO compra VALUES('012', '0006', '2018/11/06', 3);
INSERT INTO compra VALUES('012', '0007', '2018/11/06', 3);
INSERT INTO compra VALUES('012', '0008', '2018/11/06', 3);
INSERT INTO compra VALUES('013', '0006', '2020/10/06', 2);
INSERT INTO compra VALUES('013', '0003', '2017/10/06', 2);
INSERT INTO compra VALUES('015', '0004', '2003/11/06', 1);
INSERT INTO compra VALUES('015', '0002', '2019/11/06', 1);
INSERT INTO compra VALUES('015', '0007', '2020/11/06', 8);

-- Tabla de clientes con todos los campos

select *
from cliente;

-- Tabla de articulos con todos los campos
select *
from articulo;

-- tabla compra con todos sus campos
select *
from compra;
-- directorio dónde guardar los archivos de datos
-- SELECT @@GLOBAL.secure_file_priv;

-- Cargar datos de un archivo externo
/*
LOAD DATA  INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/persona.csv'
 INTO TABLE cliente
 FIELDS TERMINATED BY ';'
 LINES TERMINATED BY '\n'
 IGNORE 1 ROWS;
*/
select * from cliente ;
select 'hola';

select TIMESTAMPDIFF(year,'1900-3-28',CURDATE())  ;-- calcular la edad de una persona

-- now() momento actual
select now();

-- now()-interval 5 year momento actual menos 5 años

select now()-interval 5 year;

-- month(curdate()) mes de la fecha actual
select month(curdate());

-- case when
select *, (case when (precio>100)   THEN  round(precio * 1.05,1)				 
  ELSE round(precio * 1.00,2) end  ) as precioIncrementado 
  from articulo;
  
 -- Escribir  todos los campos de la tabla articulo
 select  * from articulo; 
  
-- Listado de clientes en orden inverso al alfabético.

-- Código de los clientes que han realizado compras,
--  no se debe repetir el código del cliente si éste ha comprado 2 veces.
-- Si no escribimos distinct, se escriben todos los clientes, si han comprado varias veces se escriben repetidos
-- articulo que valen mas de 10 euros
-- articulo que valen entre 10 y 100 euros
-- Nombre y precio de cada uno de los artículos si les incrementamos el precio el 10%. 
-- No modifica la tabla, para que una tabla se modifique deberíamos usar un update
-- Incrementar el precio de los artículos con menos de 5 unidades un 10%
-- Comprobamos que se ha modificado la tabla
-- Nombre de los artículos ordenados descendentemente por el número de 
-- unidades que nos quedan en el almacén.
-- Máximo de unidades que hay de un artículo 
-- Código de los artículos adquiridos por el cliente 015
-- ponemos un alias al campo denom para que en la columna de la tabla resultante
-- aparezca nombre articulo que es más significativo que  denom

          -- con inner join

-- Nombre del cliente que ha comprado una unidad entre el 2000 y el 2005
-- Clientes que han comprado un ordenador portátil
-- nombre de los ARTICULOS que tienen mas unidades en almacen que el 
-- articulo '0001'
-- gastos de los clientes que han comprado alguna vez
-- (agrupamos por cliente y sumamos sus gastos el número de unidades de un producto por su precio)
-- gastos superiores a 1000 de los clientes que ha comprado alguna vez
-- --- ----- cuando son resultados de las funciones de agregación se comparan en having
-- --- ------ las funciones de agregación no se utilizan en where

-- Articulos que aún no se han comprado
-- (si no sale ningún artículo, haz un insert into con un articulo nuevo)
         -- con subconsulta
         -- con left join 
         -- con right join
  
 -- clientes que han comprado al menos una unidad de todos los articulos
-- existentes en almacen
-- (calculamos el número de artículos distintos que ha comprado un cliente
-- y comprobamos en having si esa cantidad es igual 
-- al número total de artículos existentes en el almacen)

 -- articulos vendidos cuyo precio es menor que el precio medio de todos los articulos
   
-- 	Código de los clientes que han comprado algún artículo este año

-- Nombre  de los clientes y los artículos comprados, ordenados por el nombre del cliente

-- 	Listado del cliente y el número total de unidades de artículos adquiridos por éste 

-- 	Precio medio de los artículos del almacén

-- Listado con el número de unidades compradas de cada artículo

-- Nombre del cliente que más unidades ha adquirido de algún artículo 
-- (NO se puede poner un limit 1 y ordenar descendente
-- porque puede haber más de un cliente que haya comprado el máximo de unidades
-- de esta forma nos salen todos los que han comprado el máximo de unidades)

-- Clientes que han realizado más de 2 compras
-- agrupamos por el nombre de cliente y contamos las filas que tiene ese cliente, 
-- que vienen determinada por el artículo


-- vista gastos por cliente

-- comprobamos que ha creado la vista
          
-- articulos de los que se han vendido el máximo de unidades
-- Cliente que ha comprado sólo ratones

-- Creo un cliente nuevo que realice una compra de ratones, 
-- así este cliente será el resultado de mi consulta (quitar los comentarios para hacer 
-- esta consulta y ejecutar las dos instrucciones)
-- INSERT INTO cliente VALUES ('099', 'Pepe Ratones', 'Ratonera 99', 999999999);
 -- INSERT INTO compra VALUES('099', '0005', '2021/11/06', 3);


DROP DATABASE IF EXISTS turismo;
CREATE DATABASE turismo;
USE turismo;
/*
DROP TABLE IF EXISTS realizaActividad;
DROP TABLE IF EXISTS habitacion;
DROP TABLE IF EXISTS alojamiento;
DROP TABLE IF EXISTS personal;
DROP TABLE IF EXISTS actividad;
*/
CREATE TABLE  pueblo (
  codPueblo   SMALLINT PRIMARY KEY,
  nombreP       VARCHAR(60)
);

CREATE TABLE  actividad(
  codActividad SMALLINT,
  nomActividad VARCHAR(30) NOT NULL,
  descripcion VARCHAR(50) NOT NULL,
  nivel SMALLINT,
  PRIMARY KEY (codActividad)
) ;
CREATE TABLE  hotel (
  num smallint PRIMARY KEY,
  nombreHotel   VARCHAR(30),
  direccion     VARCHAR(100) NOT NULL,
  numHab        SMALLINT DEFAULT 0,
  codigoP       SMALLINT, 
  FOREIGN KEY (codigoP) REFERENCES pueblo(codPueblo)
  ON DELETE CASCADE
  ON UPDATE CASCADE
) ;

  CREATE TABLE  telefono(
   numTel VARCHAR(9),
   numeroHotel smallint,
   PRIMARY KEY (numTel),
   FOREIGN KEY (numeroHotel) REFERENCES hotel(num)
  ) ;-- no tienen teléfonos comunes dos establecimientos
  
 CREATE TABLE personal (
  codP   SMALLINT,
  NIF	 VARCHAR(9) NOT NULL UNIQUE,
  nombre VARCHAR(30) NOT NULL,
  ape1	 VARCHAR(30) NOT NULL,
  ape2 	 VARCHAR(30) NOT NULL,
  direccion  VARCHAR(100),
  nomHotel 	 SMALLINT,
  PRIMARY KEY (codP),
  FOREIGN KEY (nomHotel) REFERENCES hotel(num)
  ON DELETE CASCADE
  ON UPDATE CASCADE
  );
CREATE TABLE  esContacto (
  numeroH smallint PRIMARY KEY,
  contacto SMALLINT,
  FOREIGN KEY (numeroH) REFERENCES hotel(num)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  FOREIGN KEY (contacto) REFERENCES personal(codP)
  ON DELETE CASCADE
  ON UPDATE CASCADE
) ;
CREATE TABLE  habitacion(
  numeroHab SMALLINT, 
  nomHotel SMALLINT,
  tipo SMALLINT NOT NULL, 
  banno BOOLEAN,
  precio NUMERIC(6,2),
  PRIMARY KEY (nomHotel, numeroHab),
  FOREIGN KEY (nomHotel) REFERENCES hotel(num)
  ON DELETE CASCADE
  ON UPDATE CASCADE
) ;

CREATE TABLE realizaActividad(
  idActividad SMALLINT,
  idHotel SMALLINT,
  diaSemana VARCHAR(10),
  PRIMARY KEY (idActividad, idHotel),
  FOREIGN KEY (idHotel) REFERENCES hotel(num)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  FOREIGN KEY (idActividad) REFERENCES actividad(codActividad)
  ON DELETE CASCADE
  ON UPDATE CASCADE
  );
LOAD DATA  INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/pueblos.csv'
 INTO TABLE pueblo
 CHARACTER SET latin1
 FIELDS TERMINATED BY ';'
 LINES TERMINATED BY '\n'
 IGNORE 1 ROWS;
-- SELECT @@GLOBAL.secure_file_priv;
-- en este trigger solo hay un ; al final no es necesario poner delimiter 
CREATE TRIGGER sumarHabitacionesAIhotel
AFTER INSERT ON habitacion
FOR EACH ROW
UPDATE hotel
SET numHab=numHab + 1
WHERE num = NEW.nomHotel;

show triggers;-- para ver los trigger creados
-- Calcular el número de habitaciones
delimiter //
CREATE TRIGGER restarHabitacionesAD
AFTER DELETE ON habitacion
FOR EACH ROW
UPDATE hotel
SET numHab = numHab - 1
WHERE num = OLD.nomHotel;
delimiter ;

INSERT INTO hotel(num,nombreHotel,direccion,codigoP) VALUES (1,'Hotel Rural Marcos','Avenida de el Paular, 34',117);
INSERT INTO hotel(num,nombreHotel,direccion,codigoP) VALUES (2,'Hotel Sara De Ur','Calle del camping, s/n',30);
INSERT INTO hotel(num,nombreHotel,direccion,codigoP) VALUES (3,'Hotel Los Manzanos','Avenida del Valle, 50',117);
INSERT INTO hotel(num,nombreHotel,direccion,codigoP) VALUES (4,'Hotel Ciclo Lodge','Cuatro Calles, 1',76);

INSERT INTO telefono VALUES ('918697890',1);
INSERT INTO telefono VALUES ('686789098',1);
INSERT INTO telefono VALUES ('918430034',2);
INSERT INTO telefono VALUES ('918693456',3);

INSERT INTO personal VALUES (1,'78123456J', 'Angela', 'Callejo','Garcia','Juan Martin 11 ',1);
INSERT INTO personal VALUES (2,'78345684K', 'Loreto', 'Borja','Callejo', 'Luna 4 ',1);
INSERT INTO personal VALUES (3,'78345300I', 'Torcuato', 'Arribas','Alonso','Ermita 6 ', 1);
INSERT INTO personal VALUES (4,'78334455P', 'Albino', 'Paciencia','Riomoros','Sarria 2 ', 1);
INSERT INTO personal VALUES (5,'78000111H', 'Yolanda', 'Barahona','Garcia ', 'Arturo Soria 24',2);
INSERT INTO personal VALUES (6,'78434343U', 'Isabel', 'Garcia','Garcia ','Clavel 5 ', 2);
INSERT INTO personal VALUES (7,'78876987P', 'Clara', 'Alamo','Sanz','Travesia Luna 11 ',2);
INSERT INTO personal VALUES (8,'78001100J', 'Valentin', 'Riomoros','Borja ','Manchester 25 ', 2);
INSERT INTO personal VALUES (9,'78321321I', 'Juan Antonio', 'Sanz','Garcia','Cercona 24', 2);
INSERT INTO personal VALUES (10,'78779900T', 'Lucas', 'Gonzalez','Arribas','Lavaderos 34 ',2);
INSERT INTO personal VALUES (11,'78000011V', 'Eustaquia', 'Alonso','Montero','Nogales 5 ',3);
INSERT INTO personal VALUES (12,'78112277J', 'Luis', 'Montero','Riomoros','Eras 10 ',3);
INSERT INTO personal VALUES (13,'78123462Z', 'Angel', 'Riocal','Garcia','Las Escuelas',3);
INSERT INTO personal VALUES (14,'78123400M', 'Maribel', 'Calle','Alonso','Travesia del Rio 9', 4);
INSERT INTO personal VALUES (15,'78123420J', 'Jose Luis', 'Revoltoso','Riocal','Pensamiento 56 ', 4);

INSERT INTO esContacto VALUES (1,1);
INSERT INTO esContacto VALUES (2,6);
INSERT INTO esContacto VALUES (3,13);
INSERT INTO esContacto VALUES (4,14);

INSERT INTO actividad VALUES (1,'senderismo','Camino Natural Valle del Lozoya',4);
INSERT INTO actividad VALUES (2,'parapente','Pico de la Miel',1);
INSERT INTO actividad VALUES (3,'piraguismo','Embalse de Lozoya',3);
INSERT INTO actividad VALUES (4,'mountain bike','Ruta al nevero',1);

INSERT INTO realizaActividad VALUES (1,1,'lunes');
INSERT INTO realizaActividad VALUES (2,2,'martes');
INSERT INTO realizaActividad VALUES (3,3,'jueves');
INSERT INTO realizaActividad VALUES (4,3,'domingo');
INSERT INTO realizaActividad VALUES (1,2,'martes');
INSERT INTO realizaActividad VALUES (1,3,'miercoles');
INSERT INTO realizaActividad VALUES (1,4,'jueves');
INSERT INTO realizaActividad VALUES (4,4,'domingo');

INSERT INTO habitacion VALUES(1,1,1,1,30); -- habitacion 1 del hotel 1 con 1 cama
INSERT INTO habitacion VALUES(1,2,1,1,30);
INSERT INTO habitacion VALUES(1,3,1,1,30);
INSERT INTO habitacion VALUES(1,4,1,1,30);
INSERT INTO habitacion VALUES(2,1,2,1,60);-- habitacion 2 con dos camas
INSERT INTO habitacion VALUES(2,2,2,1,60);
INSERT INTO habitacion VALUES(2,3,2,1,60);
INSERT INTO habitacion VALUES(2,4,2,1,60);
INSERT INTO habitacion VALUES(3,1,3,1,90);-- habitación 3 con 3 camas
INSERT INTO habitacion VALUES(3,2,3,1,100);
INSERT INTO habitacion VALUES(3,3,3,1,95);
INSERT INTO habitacion VALUES(3,4,3,1,110);
 


select * from hotel;
select * from actividad;

-- Este script es para realizar consultas con varias tablas
-- Numero de empleados por hotel
-- Numero de empleados por hotel
select nombreHotel, count(codP)
from hotel as h inner join personal as p on h.num=p.nomHotel
group by nombreHotel;
select nomActividad
from actividad
where  nomActividad like'S%'; 

create view numeroPersonas(nHotel, numPersonas) as
select nombreHotel, count(codP)
from hotel as h inner join personal as p on h.num=p.nomHotel
group by nombreHotel;

select * from numeroPersonas;
select nHotel
from numeroPersonas
where numPersonas = (select max(numPersonas) from numeroPersonas);

-- nombre de los empleados por hotel
select nombreHotel, concat(nombre,' ',ape1,' ',ape2)
from hotel as h inner join personal as p on h.num=p.nomHotel
order by nombreHotel;

-- Listar todos los empleados de cada hotel



Select nombreHotel, concat(nombre,' ',ape1,' ',ape2)
from hotel as h inner join personal as p on h.num=nomHotel
order by nombreHotel;

-- Nombre de los hoteles que tiene más de 3 empleados, >3
select nombreHotel, count(codP) as numEmpleados
from hotel as h inner join personal as p on h.num=nomHotel
group by nomHotel
having numEmpleados>3;
-- Hotel y actividades que realiza
select nombreHotel nombreHotel,nomActividad as actividad
from hotel as h inner join  realizaActividad as r inner join actividad as a on 
     h.num=r.idHotel and r.idActividad=a.codActividad;

-- Hotel que ha realizado todas las actividades
select nombreHotel, count(idActividad) as num
from hotel as h inner join  realizaActividad as r  on 
     h.num=r.idHotel 
group by nombreHotel
having num= (select count(codActividad) from actividad);

-- Listar en orden alfabético todos los empleados el hotel
-- Nombre de los hoteles que tiene más de 3 empleados, >3
select nombreHotel, count(codP) as numEmpleados
from hotel as h inner join personal as p on h.num=nomHotel
group by nomHotel
having numEmpleados>3;
-- Hotel que ha realizado todas las actividades
                     
-- 2. Nombre de los hoteles que se han inaugurado en los 5 últimos años
-- 3. Incrementar el sueldo de las personas de contacto el 10%
-- 4. Personas que su primer apellido comience por R que sean personas de contacto
-- 5. Nombre de los hoteles que han organizado una actividad de senderismo y no de mountain
-- bike
-- 6. Hotel que sólo ha realizado actividades los fines de semana
-- 7. Actividades que se han realizado en cada uno de los hoteles y el día de la semana que se han
-- organizado
-- 8. Nombre de las personas que cobran más de 10000 euros y alguno de sus apellido comience
-- por A
-- 9. Nombre de la actividad y número de veces se ha realizado
-- 10. Listado de los hoteles y personal que trabaja en ellos
-- 11. Cuál es la actividad que más veces se ha realizado
-- 12. Número de habitaciones por hotel
-- 13. Precio medio de las habitaciones por hotel
-- 14. Número de alojamientos por pueblo
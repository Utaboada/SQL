CREATE DATABASE CORRUPCION;
  -- DROP DATABASE CORRUPCION;
  
USE corrupcion;

CREATE TABLE caso (
nombreC VARCHAR(30) PRIMARY KEY,
Descripcion VARCHAR (60) NOT NULL,
CantDef VARCHAR (20)
);

CREATE TABLE FRAUDE (
DNI VARCHAR(30) PRIMARY KEY,
nombreF varchar (30) not null,
direcF varchar (40) not null,
cargodia varchar (40) not null,
patrim varchar (40) not null
);

 -- DROP TABLE CASO;
 -- ALTER TABLE CASO 
-- drop column alcance;

CREATE TABLE implicado (
DNIimpli VARCHAR(30),
NOMBRECASO VARCHAR (30),
primary key (DNIimpli,nombrecaso),
FOREIGN KEY (DNIIMPLI) REFERENCES FRAUDE(DNI)
ON DELETE CASCADE
ON UPDATE CASCADE


);
 -- DROP  TABLE IMPLICADO;


create table familia (
DNIF VARCHAR(30),
IDfam smallint,
primary key (DNIF),
FOREIGN KEY (DNIF) REFERENCES FRAUDE(DNI)
ON DELETE CASCADE
ON UPDATE CASCADE
);


CREATE TABLE juez (
IDjuez SMALLINT PRIMARY KEY,
nomJ VARCHAR (60) NOT NULL,
fechaini date Not null,
fechanac date Not null,
direcJ VARCHAR (40) NOT NULL

);

-- DROP TABLE FRAUDE;

CREATE TABLE periodico (
PWeb VARCHAR (60) Not null,
nombreP VARCHAR (40) NOT NULL,
DirecP varchar (60) not null,
IdP SMALLINT PRIMARY KEY,
Alcance varchar(30),
digital boolean not null default 1
 );
 -- ALTER TABLE periodico 
-- ADD alcance VARCHAR(30) NOT NULL;
 -- ALTER TABLE periodico
-- ADD IdP SMALLINT NOT NULL;


create table destapado (
nombreCD VARCHAR(30),
idper smallint,
diaCD date NOT NULL,
PRIMARY KEY (NombreCD),
FOREIGN KEY (NombreCD) REFERENCES CASO(nombreC)
ON DELETE CASCADE
ON UPDATE CASCADE

);
-- DROP TABLE destapado;

create table investiga (
nombreCJ VARCHAR(30),
IdJC SMALLINT,
sentencia varchar (90),
primary key (nombreCJ),
FOREIGN KEY (nombreCJ) REFERENCES CASO(nombreC)
ON DELETE CASCADE
ON UPDATE CASCADE
);
 -- DROP TABLE INVESTIGA;
-- ALTER TABLE investiga  
-- ADD sentencia VARCHAR(90) ;


CREATE TABLE  ciudad (
Idcity smallint primary key,
nomcity varchar (30)
);


create table ocurre (
nomcase varchar(30),
idciu smallint,
primary key(nomcase),
foreign key(nomcase) references caso(nombreC)
ON DELETE CASCADE
ON UPDATE CASCADE

);


CREATE TABLE ambito (

TipoAmb VARCHAR (30), 
NomCasoA VARCHAR (30),
primary key(tipoamb,nomcasoa)
);
-- DROP TABLE AMBITO;


CREATE TABLE parentesco (
DNIFr1 VARCHAR(30),
DNIFr2 VARCHAR(30),
Parentesc VARCHAR (30),
 primary key (DNIFr1),
 FOREIGN KEY (DNIFr1) REFERENCES FRAUDE(DNI)
ON DELETE CASCADE
ON UPDATE CASCADE

 );

-- ALTER TABLE PARENTESCO
-- ADD Parentesco VARCHAR(30) NOT NULL;

 CREATE TABLE PARTIDO (
 NomParti VARCHAR (40) NOT NULL,
 direcSed VARCHAR (40) NOT NULL,
 PRIMARY KEY (NomParti)
 );
 
 CREATE TABLE PERTENECE (
 DNIFrau VARCHAR(30),
NomP VARCHAR(40),
puesto VARCHAR(30),
primary key (DNIFrau),
FOREIGN KEY (DNIFrau) REFERENCES FRAUDE(DNI)
ON DELETE CASCADE
ON UPDATE CASCADE
 );
 

 CREATE TABLE telefono (
nomPartido varchar (40),
numTlf varchar(40),
primary key (NumTlf)
 );
 -- drop table telefono;
 
 Create table afinidad (
nomPart VARCHAR(30),
idPe smallint,
primary key (idpe),
FOREIGN KEY (idpe) REFERENCES PERIOdICO(idp)
ON DELETE CASCADE
ON UPDATE CASCADE
 );
 -- DROP TABLE AFINIDAD;
 
INSERT INTO CASO VALUES ('3 PER CENT','Estafa de empresa a clientes', '1800000000');
INSERT INTO CASO VALUES ('Aceinsa','Trato de favores', '300000');
INSERT INTO CASO VALUES ('ACM','saqueo arcas publicas', '500000');
INSERT INTO CASO VALUES ('Alonsortegui Eraikiz','Malversacion y trafico de influencias', '4100000');
INSERT INTO CASO VALUES ('Aguas de Calpe','contaminacion', '1073316');


INSERT INTO FRAUDE VALUES ('45246877P','Evan Peters', 'Calle Sales 24, Coruña','Director general','40000000'); 
INSERT INTO FRAUDE VALUES ('14789364H','Samuel L. Jackson', 'Calle Camino,13, Madrid','Contable','800000'); 
INSERT INTO FRAUDE VALUES ('78567342H','Brad Pit', 'Calle Lobos 31, Madrid','Director principal','3500000');
INSERT INTO FRAUDE VALUES ('89674562F','Leonardo Dicaprio', 'Calle Jones,22 Valencia','Subdirector','25000000');
INSERT INTO FRAUDE VALUES ('56348567S','Joaquin Phoenix', 'Calle Luces 24, Barcelona','Ministro','1400000');
INSERT INTO FRAUDE VALUES ('44587690J','Rihanna', 'Calle Cabras 10, Madrid','Directora pricipal','9870000');
INSERT INTO FRAUDE VALUES ('65478878I','Nathy Peluso', 'Calle pereza 75, Valencia','Administrativa','2000000');
INSERT INTO FRAUDE VALUES ('78567492I','Britney Spears', 'Calle cuatro 2, Malaga','Relaciones internacionales','2750000');
-- ALTER TABLE CASO DROP COLUMN  TIPOC;

INSERT INTO CIUDAD VALUES (1,'Barcelona');
INSERT INTO CIUDAD VALUES (2,'Madrid');
INSERT INTO CIUDAD VALUES (3,'Bilbao');

INSERT INTO OCURRE VALUES ('3 PER CENT',1);
INSERT INTO OCURRE VALUES ('Aceinsa',1);
INSERT INTO OCURRE VALUES ('Aguas de Calpe',1);
INSERT INTO OCURRE VALUES ('ACM',2);
INSERT INTO OCURRE VALUES ('Alonsortegui Eraikiz',3);




-- disable safe update mode
SET SQL_SAFE_UPDATES=0;
-- execute update statement
-- ESTO ES UN EJEMPLO UPDATE table SET column='value';
-- enable safe update mode
 SET SQL_SAFE_UPDATES=1;



INSERT INTO AMBITO VALUES ('Comunidad','3 PER CENT');
INSERT INTO AMBITO VALUES ('Estafa colectiva','3 PER CENT');
INSERT INTO AMBITO VALUES ('Ayuntamiento','3 PER CENT');
INSERT INTO AMBITO VALUES ('Caja','Aceinsa');
INSERT INTO AMBITO VALUES ('Banco','ACM');
INSERT INTO AMBITO VALUES ('Dinero Publico','ACM');
INSERT INTO AMBITO VALUES ('Malversacion','Alonsortegui Eraikiz');
INSERT INTO AMBITO VALUES ('Estado','Aguas de Calpe');
INSERT INTO AMBITO VALUES ('Contaminacion','Aguas de Calpe');


insert into parentesco values ('45246877P','78567342H','Hermano');
insert into parentesco values ('44587690J','45246877P','Hermano');
insert into parentesco values ('78567342H','44587690J','Hermano');
insert into parentesco values ('89674562F','65478878I','Marido');
insert into parentesco values ('65478878I','89674562F','Mujer');
insert into parentesco values ('56348567S','78567492I','Padre');
insert into parentesco values ('78567492I','56348567S','Hijo');


INSERT INTO FAMILIA VALUES ('45246877P','1');
INSERT INTO FAMILIA VALUES ('78567342H','1');
INSERT INTO FAMILIA VALUES ('44587690J','1');
INSERT INTO FAMILIA VALUES ('14789364H','2');
INSERT INTO FAMILIA VALUES ('89674562F','3');
INSERT INTO FAMILIA VALUES ('65478878I','3');
INSERT INTO FAMILIA VALUES ('56348567S','4');
INSERT INTO FAMILIA VALUES ('78567492I','4');


INSERT INTO JUEZ VALUES ('1','Juan Fernandez', '1996/08/12','1975/04/11','Calle J, 75, Madrid');
INSERT INTO JUEZ VALUES ('2','Ana Martinez', '03/10/12','84/05/14','Calle Monos, 22, Valencia');
INSERT INTO JUEZ VALUES ('3','Lorena Garcia', '99/10/2','77/04/1','Calle Gaita, 3, Barcelona');


INSERT INTO investiga VALUES ('3 PER CENT', '1','Todos los implicados culpables y 15 años de prision');
INSERT INTO investiga VALUES ('Aceinsa','2','Libertad condicional con 5.000.000 de fianza ');
INSERT INTO investiga VALUES ('ACM','2','Prision permanente revisable');
INSERT INTO investiga VALUES ('Alonsortegui Eraikiz','3','600 horas de trabajos para la communidad');
INSERT INTO investiga VALUES ('Aguas de Calpe','3','3 años de prision para todos los implicados');


INSERT INTO IMPLICADO VALUES ('45246877P','3 PER CENT');
INSERT INTO IMPLICADO VALUES ('14789364H','3 PER CENT');
INSERT INTO IMPLICADO VALUES ('78567342H','Aceinsa');
INSERT INTO IMPLICADO VALUES ('89674562F','Aceinsa');
INSERT INTO IMPLICADO VALUES ('44587690J','ACM');
INSERT INTO IMPLICADO VALUES ('78567492I','ACM');
INSERT INTO IMPLICADO VALUES ('65478878I','Alonsortegui Eraikiz');
INSERT INTO IMPLICADO VALUES ('56348567S','Aguas de Calpe');
-- ALTER TABLE FRAUDE 
-- ADD patrim VARCHAR(40); 

INSERT INTO PARTIDO VALUES ('PP','Calle Torero 7, Madrid');
INSERT INTO PARTIDO VALUES ('PSOE','Calle Marcos 94, Madrid');
INSERT INTO PARTIDO VALUES ('PNV','Calle Aivalaostia 6, Bilbao');


insert into pertenece values('78567342H','PP','Presidente');
insert into pertenece values('89674562F','PP','Vicepresi');
insert into pertenece values('56348567S','PP','Contable');
insert into pertenece values('44587690J','PSOE','relaciones publicas');
insert into pertenece values('78567492I','PSOE','Vicepresi');
insert into pertenece values('65478878I','PNV','Presidente');




 SET SQL_SAFE_UPDATES=0;
-- execute update statement
-- ESTO ES UN EJEMPLO UPDATE table SET column='value';
-- enable safe update mode
SET SQL_SAFE_UPDATES=1;

INSERT INTO PERIODICO VALUES ('www.lavoz.es','La voz de Galicia', 'Calle Mafia 6, Coruña',1,'Regional',1);
INSERT INTO PERIODICO VALUES ('www.nytimes.es','New York Times', 'Calle vicente, Madrid',2,'Internacional',0);
INSERT INTO PERIODICO VALUES ('www.pais.es','El pais', 'Calle siete,22 Valencia',3,'Nacional',1);


INSERT INTO DESTAPADO VALUES('3 PER CENT',1,'2012/04/17');
INSERT INTO DESTAPADO VALUES('Aceinsa',1,'2012/10/10');
INSERT INTO DESTAPADO VALUES('ACM',1,'2007/08/07');
INSERT INTO DESTAPADO VALUES('Alonsortegui Eraikiz',2,'2004/09/27');
INSERT INTO DESTAPADO VALUES('Aguas de Calpe',3,'2012/11/16');


insert into telefono values('PP','652012478');
insert into telefono values('PP','981254637');
insert into telefono values('PSOE','981456745');
insert into telefono values('PSOE','695421587');
insert into telefono values('PNV','988456752');
-- delete from telefono;


insert into afinidad values('PP','3');
insert into afinidad values('PP','2');
insert into afinidad values('PNV','1');

-- --------------------------------------- CONSULTAS ------------------------------

-- 1. CIUDAD CON MAS CASOS DE CORRUPCION

SELECT idcity, nomcity,nomcase 
from ciudad as c inner join ocurre as o on
c.idcity = o.idciu
group by nomcase order by idcity;

-- 2. TOTAL DE DINERO DEFRAUDADO DE CADA PARTIDO
create view caso_partido(casoo, partidoo) as
select nombrecaso, nomp
from implicado as i inner join pertenece as p on
 i.dniimpli=p.dnifrau
group by nombrecaso;
-- drop view caso_partido;

create view dineroparti (pasrtido,cantDef,nomcrec) as
select partidoo, sum(cantDef), nombrec
from caso_partido as cp inner join caso as c on
 cp.casoo=c.nombrec
group by partidoo;
drop view dineroparti;

-- 3. PERIODICO QUE MAS CASOS HA DESTAPADO

select nombreP, COUNT(nombrecd) AS 'total casos destapados'
FROM periodico as p inner join destapado as d on
p.idp = d.idper
group by nombreP;

-- 4. AÑO EN EL QUE SE DESCUBRIERON MAS CASOS
    -- 4.1  consulta para agrupar los casos por año
           select nombreCd, year(diacd) from destapado;

SELECT count(nombrecd) as totalCasos, year(diacd)
FROM  destapado
GROUP BY year(diacd)
ORDER BY year(diacd) DESC ;

    -- 4.2 una pequeña consulta para buscar los casos que ocurrieron en un año determinado
           SELECT * FROM destapado WHERE  YEAR(DIACD) = 2012;

-- 5. TOTAL DE PERSONAS IMPLICADAS EN CADA CASO
   select count(DNIimpli) as 'total implicados', nombrecaso from 
   implicado
   group by nombrecaso;
   
   
-- 6. PATRIMONIO DE CADA FAMILIA
select IDfam, COUNT(DNIF) as 'miebros familia', sum(patrim)  AS total
FROM familia as f inner join fraude as fr on
f.DNIF = fr.DNI
group by IDfam
order by IDfam;

-- 7.FRAUDES CON MAS DE 3.000.000 € 
select nombreF, patrim from fraude
where patrim > 3000000;

-- 8. JUECES QUE INVESITGAN CASOS DONDE SE HAN DEFRAUDADO MAS DE 800.000 €
select nomj, nombreC, cantdef
from juez as j inner join  investiga as i inner join caso as c on 
     j.idjuez=i.idjc and i.nombreCJ=c.NOMBREC
     having cantdef > 800000;

-- 9. SENTENCIAS QUE HAN ACABADO EN PRISION
select * from investiga where sentencia like '%prision%';


-- 10 CARGO QUE TENIAN EL DIA QUE EL CASO SE DESTAPÓ
	select nombrecaso, nombreF, cargodia 
	from implicado as i inner join fraude as f on
	i.DNIImpli = f.DNI
	order by nombrecaso;
    
-- 11. Familias distintas implicadas en cada caso

select nombreC, IdFam, NombreF
from caso as c inner join implicado as i inner join familia as f inner join fraude as fr on
c.nombrec = I.nombrecaso and I.DNIImpli = F.DNIF and  F.DNIF = Fr.DNI
order by nombreC;

-- 12. NUMERO DE CASOS EN LOS QUE ESTA METIDA CADA FAMILIA
create view fam_chanchullo(nombreC,IdFam,NombreF) as
select nombreC, IdFam, NombreF
from caso as c inner join implicado as i inner join familia as f inner join fraude as fr on
c.nombrec = I.nombrecaso and I.DNIImpli = F.DNIF and  F.DNIF = Fr.DNI
order by nombreC;

select  COUNT(nombreC) as 'casos totales involucrados', idfam from fam_chanchullo
group by IDfAM
ORDER BY IDFAM;

-- 13. FAMILIA QUE ESTA METIDA EN MAS CASOS DIFERENTES
create view max_casos(total, idfam) as
select  COUNT(nombreC) as 'casos totales', idfam from fam_chanchullo
group by IDfAM
ORDER BY IDFAM;

select max(total) as 'total casos', idfam from max_casos;

-- 14. NOMBRES DE LOS MIEMBROS DE CADA FAMILIA Y PARENTESCO SOLO SI HAY PARENTESCO
 select idfam,DNIFr1,nombreF,parentesc
 from familia as f inner join parentesco as p inner join fraude as fr on
 f.DNIF = p.DNIFr1 and p.DNIFr1 = fr.DNI
 group by nombreF
 ORDER BY idfam;
 
-- 15. FRAUDES QUE VIVAN EN UNA CALLE QUE TERMINA POR 'S'
SELECT NOMBREF,direcf FROM fraude WHERE direcf LIKE "%s %" ;

-- 16. FRAUDES QUE TENIAN UN PUESTO DE DIRECTOR EL DIA QUE SE DESTAPÓ EL CASO
select nombreF,cargodia
from fraude where cargodia like "director%";

-- 17. EDAD DE CADA JUEZ CUANDO EMPEZO A EJERCER LA PROFESION 
select idjuez,nomj,TIMESTAMPDIFF(year,fechanac,fechaini) as 'años' from juez;


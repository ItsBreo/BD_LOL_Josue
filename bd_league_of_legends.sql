drop database if exists bd_league_of_legends;
create database bd_league_of_legends;
use bd_league_of_legends;

create table tipo_runa (
id_tipo_runa int not null,
nombre varchar (500),
estadisticas varchar (500),
definicion varchar (500),
uso varchar (500),
primary key (id_tipo_runa)
);

insert into tipo_runa value(1,'Conquistador','Daño y vida adaptable','Acumulaciones que otorgan DA adicional y PH adaptable según el nivel','Usado normalmente por luchadores');
insert into tipo_runa value(2,'Cosecha oscura','Daño eplosivo','Al matar campeones, subditos y monstruos recoges almas, al dar un ataque contra un campeón consume almas','Usado normalmente por asesinos o magos con daño explosivo');
insert into tipo_runa value(3,'Garra del inmortal','Daño adicional mediante vida maxima','Das tu ataque básico con daño mágico adicional según tu vida máxima cada 4s.','Usado por tanques');
insert into tipo_runa value(4,'Cometa arcano','Daño adicional con habiliades','Al inflingir daño con una habilidad proyecta un cometa contra el mismo, si esta en enfriamiento se reduce.','Usado por magos de pokeo');
insert into tipo_runa value(5,'Mejora glacial','Ralentización de enemigos','Al inmovilizar un campeón emana tres lineas de hielo que ralentizan a los enemigos','Usado por campeones que tengan habilidades de inmovilización');

create table runas (
id_runa int not null,
nombre varchar (500),
descripcion varchar (500),
uso varchar (500),
popularidad boolean,
id_campeon int not null,
primary key (id_runa)
);

insert into runas value(1,'Precision','aumenta el daño y la velocidad de ataque del campeón','tiradores y luchadores',true,1);
insert into runas value(2,'Dominacion','mejora el potencial de asesinato y la capacidad de infligir daño', 'asesinos', true,2);
insert into runas value(3,'Valor','aumenta la durabilidad del campeón y su capacidad para resistir daño','tanques',false,3);
insert into runas value(4,'Ingenio','mejora la capacidad de enfriamiento y la movilidad del campeón','magos',true,4);
insert into runas value(5,'Inspiracion','proporciona habilidades especiales y ventajas para el campeón','soportes',true,5);


create table runas_tipo_runa (
id_runa int not null,
id_tipo_runa int not null,
primary key (id_runa, id_tipo_runa)
);

insert into runas_tipo_runa value(1,1);
insert into runas_tipo_runa value(2,2);
insert into runas_tipo_runa value(3,3);
insert into runas_tipo_runa value(4,4);
insert into runas_tipo_runa value(5,5);

create table equipos (
id_equipo int not null,
nombre varchar(500),
posicion varchar(500),
antiguedad date,
num_jugadores varchar(500),
id_jugador int not null,
primary key (id_equipo)
);

insert into equipos value(1,'Cloud9','Primero','2012-12-24',1,1);
insert into equipos value(2,'G2','Segundo','2013-07-16',2,2);
insert into equipos value(3,'T1','Quinto','2002-10-2',3,3);
insert into equipos value(4,'DWG Kia','Tercero','2019-10-22',10,4);
insert into equipos value(5,'RNG','Cuarto','2015-02-15',10,5);

create table torneos (
id_torneo int not null,
premio varchar (500),
nombre varchar(500),
localizacion varchar (500),
epoca varchar(500),
id_equipo int not null,
primary key (id_torneo)
);

insert into torneos value(1,'200.000€','LCS','Los Angeles','Primavera',1);
insert into torneos value(2,'225.000€','LEC','Berlin','Invierno',2);
insert into torneos value(3,'257.000€','LCK','Seúl','Verano',3);
insert into torneos value(4,'468.000€','LPL','Shanghai','Otoño',4);
insert into torneos value(5,'700.000€','MSI','Busan','Primavera',5);


create table partidas (
id_partida int not null,
duracion varchar (500),
kills varchar (500),
asistencias varchar(500),
objetivos_asesinados varchar (500),
primary key (id_partida)
);

insert into partidas value(1,'40:00','45','70','8');
insert into partidas value(2,'27:00','12','27','3');
insert into partidas value(3,'17:30','10','25','1');
insert into partidas value(4,'50:00','30','50','9');
insert into partidas value(5,'35:00','25','50','5');


create table jugadores (
id_jugador int not null,
nombre_real varchar (500),
nivel varchar (500),
alias varchar (500),
edad varchar (500),
id_campeon int not null,
primary key (id_jugador)
);

insert into jugadores value(1,'Luka Perkovic','500','Perkz','24',1);
insert into jugadores value(2,'Steven Liv','350','Hans Sama','23',2);
insert into jugadores value(3,'Lee Sang-hyeok','700','Faker','26',3);
insert into jugadores value(4,'Heo Seung-joon','550','ShowMaker','23',4);
insert into jugadores value(5,'Chen Wei','600','GALA','20',5);


create table partida_jugador (
id_partida int not null,
id_jugador int not null,
primary key (id_jugador, id_partida)
);

insert into partida_jugador value(1,1);
insert into partida_jugador value(2,2);
insert into partida_jugador value(3,3);
insert into partida_jugador value(4,4);
insert into partida_jugador value(5,5);


create table objetos (
id_objeto int not null,
nombre varchar(500),
definicion varchar (500),
provinencia varchar (500),
precio varchar(500),
primary key (id_objeto)
);

insert into objetos value(1,'Fuerza del viento','Su activa da un pequeño a una dirección deseada que además genera daño en area circular','Demacia',3300);
insert into objetos value(2,'Cancion de guerra de Shurelya','Proporciona activamente velocidad de movimiento a quienes estén cerca del portador del Shurelya','Shurima','2500');
insert into objetos value(3,'Cintomisil Hextech','Da un pequeño salto al campeon que lo porta, además de dar daño mágico en una zona cónica.','Piltover y Zaun','3200');
insert into objetos value(4,'Fuerza del Sol','Proporciona armadura, vida y resistencia magica al portador','Monte Targon','2900');
insert into objetos value(5,'Fuerza de la trinidad','Da daño de ataque, movilidad y velocidad de ataque pasivamente.','Ionia','3200');

create table objeto_jugador (
id_jugador int not null,
id_objeto int not null,
primary key (id_jugador, id_objeto)
);

insert into objeto_jugador value(1,1);
insert into objeto_jugador value(2,2);
insert into objeto_jugador value(3,3);
insert into objeto_jugador value(4,4);
insert into objeto_jugador value(5,5);


create table estadisticas (
id_estadistica int not null,
kda varchar(500),
asesinatos varchar(500),
asistencias varchar(500),
muertes varchar (500),
elo varchar(500),
primary key (id_estadistica)
);

insert into estadisticas value(1,'3,75',1655,2345,1200,'Grand Master');
insert into estadisticas value(2,'2,8',2637,2187,1078,'Diamante');
insert into estadisticas value(3,'1,76',2424,1434,1049,'Master');
insert into estadisticas value(4,'3,8',4632,2345,3058,'Challenger');
insert into estadisticas value(5,'2,9',3453,1234,2345,'Grand Master');

create table jugador_estadistica (
id_jugador int not null,
id_estadistica int not null ,
primary key (id_jugador,id_estadistica)
);

insert into jugador_estadistica value(1,1);
insert into jugador_estadistica value(2,2);
insert into jugador_estadistica value(3,3);
insert into jugador_estadistica value(4,4);
insert into jugador_estadistica value(5,5);

create table aspectos (
id_aspecto int not null ,
nombre varchar (500),
tematica varchar (500),
precio varchar (500),
rareza varchar (500),
exclusividad boolean,
primary key (id_aspecto)
);

insert into aspectos value(1,'KDA KaiSa','KDA',1820,'Legendario',false);
insert into aspectos value(2,'Soraka Star Guardian','Star Guardian',1820,'Legendario',false);
insert into aspectos value(3,'Akali Luna Sangrienta','Luna Sangrienta',1350,'Épico',false);
insert into aspectos value(4,'Maokai Bosque Ancestral','Bosque Ancestral',1350,'Épico',true);
insert into aspectos value(5,'Irelia Hoja Divina','Hoja divina','1350','Épico',true);

create table habilidades (
id_habilidad int not null ,
Nombre varchar(500),
enfriamento varchar (500),
descripcion varchar (500),
uso varchar (500),
id_campeon int not null,
primary key (id_habilidad)
);

insert into habilidades value(1,'Lluvia de cohetes de Icathia','8 segundos','Lanzan una lluvia de cohetes hacia uno o varios enemigos','Uso por Kaisa',1);
insert into habilidades value(2,'Estrella Celeste','5 segundos','Cae una estrella en un determinado circulo que si golpea a un enemigo le inflinge ralentización y cura a Soraka','Uso por Soraka',2);
insert into habilidades value(3,'Disciplina del Asesino','1,5 segundos si se marca al enemigo o 6,5 segundos si no se marca','Akali lanza unas cuchillas en un determinado rango que al golpear un objetivo lo marca','Uso por Akali',3);
insert into habilidades value(4,'Impacto arcano','8 segundos','Maokai lanza un puñetazo al suelo que hace crear un terremoto cerca, los enemigos que estén cerca saltan y se ralentiza','Uso por Maokai',4);
insert into habilidades value(5,'Danza de las cuchillas','12 segundos si no ejecuta al enemigo o no golpea a un objetivo marcado','Irelia se lanza al objetivo marcado en una determinada área que causa daño, si el objetivo está marcado o será ejecutado le permite a Irelia poder usar la habilidad una vez más.','Uso por Irelia',5);

create table campeones (
id_campeon int not null ,
Nombre varchar (500),
Historia varchar (500),
Rol varchar (500),
Dificultad varchar (500),
id_aspecto int not null ,
id_objeto int not null ,
id_habilidad int not null ,
primary key (id_campeon)
);

insert into campeones value(1,'KaiSa','KaiSa era una niña que por el ataque de los entes del vacío, acabó atrapada desde muy joven en las profundidades del vacio, consiguió su traje característico gracias a sus habilidadades de supervivencia','ADC',2,1,1,1);
insert into campeones value(2,'Soraka','Soraka es una celestial que bajó de los cielos para poder ayudar a los mortales de Runaterra, se convirtió en una curandera errante, al convertirse en inmortal usa sus conocimientos para poder seguir ayudando a los máximos que pueda','Support',2,2,2,2);
insert into campeones value(3,'Akali','Akali es una asesina del clan kinkou, esta quiso tomar la justicia por su propia mano y acabó con la tiranía del mago Jhin, aunque haya conseguido acabar con él y liberó a Ionia desafió las normas de su clan y se desvinculó de este para ser asesina independiente ayudando a los habitantes de su región aunque se desafíen las normas establecidas','Mid',3,3,3,3);
insert into campeones value(4,'Maokai','Maokai es un guardian del bosque, en la guerra despertó y defendió su bosque frente a los humanos ciegos del daño y rabia causada al bosque y a su guardian, Maokai usó su magia para desterrar a todos los humanos del bosque, al terminar la guerra, volvió a su sueño centenario despertando ocasionalmente para comprobar el estado del bosque. Aunque muchos lo teman, Maokai se ha transformado en guardian del bosque','Jungla',1,4,4,4);
insert into campeones value(5,'Irelia','Irelia es una joven del clan kinkou entrenada por su hermano, Noxus asesinó su familia en un solo ataque. Irelia juró venganza sobre Noxus, al destruirse el escudo de su familia se transformó mediante magia las cuchillas que esta porta para defender a su pueblo, Irelia lideró la resistencia en la que desterraría de Ionia a Noxus y ella y su pueblo estarían en paz. Irelia actualmente sigue siendo una guerrera dedicada a defender a su pueblo ante cualquier adversidad.','Top',3,5,5,5);

alter table campeones
add constraint fk_hab foreign key(id_habilidad) references habilidades (id_habilidad);

alter table campeones
add constraint fk_asp foreign key(id_aspecto) references aspectos (id_aspecto);

alter table runas
add constraint fk_camp foreign key (id_campeon) references campeones (id_campeon);

alter table runas_tipo_runa
add constraint fk_runa foreign key (id_runa) references runas (id_runa),
add constraint fk_tipo_runa foreign key (id_tipo_runa) references tipo_runa (id_tipo_runa);

alter table habilidades
add constraint fk_camp1 foreign key (id_campeon) references campeones(id_campeon);

alter table partida_jugador 
add constraint fk_jug foreign key (id_jugador) references jugadores(id_jugador),
add constraint fk_part foreign key (id_partida) references partidas(id_partida);

alter table objeto_jugador
add constraint fk_jug1 foreign key (id_jugador) references jugadores(id_jugador),
add constraint fk_obj foreign key (id_objeto) references objetos (id_objeto);

alter table campeones
add constraint fk_obj1 foreign key (id_objeto) references objetos(id_objeto);

alter table jugador_estadistica
add constraint fk_jug2 foreign key (id_jugador) references jugadores(id_jugador),
add constraint fk_est foreign key (id_estadistica) references estadisticas(id_estadistica);

alter table equipos
add constraint fk_jug3 foreign key (id_jugador) references jugadores (id_jugador);

alter table torneos
add constraint fk_eq foreign key (id_equipo) references equipos (id_equipo);

-- CREACION DE LA TABLA CLIENTE --
CREATE TABLE CLIENTE (
cod_cliente INTEGER NOT NULL,
nom_cliente VARCHAR (100)NOT NULL,
tele_cliente INTEGER  NOT NULL,
correo_cliente VARCHAR(100) NOT NULL,
dire_cliente VARCHAR (30) NOT NULL,
PRIMARY KEY (cod_cliente)
);


-- CREACION DE LA TABLA SERVICIO --
CREATE TABLE SERVICIO (
cod_servicio INTEGER NOT NULL,
tipo_servicio VARCHAR (100) NOT NULL,
valor_servicio INTEGER NOT NULL,
PRIMARY KEY (cod_servicio)
);



-- CREACION DE LA TABLA EMPLEADO --
CREATE TABLE EMPLEADO (
cod_empleado INTEGER NOT NULL,
nom_empleado VARCHAR (100) NOT NULL,
tele_empleado INTEGER NOT NULL,
PRIMARY KEY(cod_empleado)
);



--CREACION DE LA TABLA PARA LA RELACION MUCHOS A MUCHOS EMPLEADO SERVICIO--
CREATE TABLE EMPLEADO_SERVICIO (
cod_empleado INTEGER NOT NULL,
cod_servicio INTEGER,
PRIMARY KEY (cod_empleado,cod_servicio),
FOREIGN KEY (cod_empleado) REFERENCES EMPLEADO (cod_empleado),
FOREIGN KEY (cod_servicio) REFERENCES SERVICIO (cod_servicio)
);


--CREACION DE LA TABLA SALA --
CREATE TABLE SALA (
cod_sala INTEGER NOT NULL,
nom_sala VARCHAR (100) NOT NULL,
tipo_sala VARCHAR (30) NOT NULL,
cant_pers_sala INTEGER NOT NULL,
PRIMARY KEY(cod_sala)
);


--CREACION DE LA TABLA 
CREATE TABLE RESERVA (
cod_reserva INTEGER NOT NULL,
fecha_reseva DATE NOT NULL,
hora_reserva TIME NOT NULL,
precio_reserva INTEGER NOT NULL,
cod_cliente INTEGER NOT NULL,
cod_empleado INTEGER  NOT NULL,
cod_servicio INTEGER NOT NULL,
cod_sala INTEGER NOT NULL,
PRIMARY KEY (cod_reserva),
FOREIGN KEY (cod_cliente) REFERENCES CLIENTE (cod_cliente),
FOREIGN KEY (cod_empleado) REFERENCES EMPLEADO (cod_empleado),
FOREIGN KEY (cod_servicio) REFERENCES SERVICIO (cod_servicio),
FOREIGN KEY (cod_sala) REFERENCES SALA (cod_sala)
);


--CREACION DE LOS INSERT--
INSERT INTO CLIENTE VALUES (222,  'Marta Lucia Ortega Jaimes' ,3145, 'maluorja@gmail.com', 'Calle 3 # 7-56');
--CLIENTES --


INSERT INTO CLIENTE VALUES (222, 'Carlos Faryd Jaimes Cardenas', 3129, 'cafajaca@gmail.com', 'Calle 5 # 3-34');
INSERT INTO CLIENTE VALUES (333,'jairo Villamizar Maldonado' ,3128, 'javima@gmail.com', 'Calle 3 # 8-21');
INSERT INTO CLIENTE VALUES (444, 'Carmen Julia Comezaña Vera', 3125,'cajucove@gmail.com', 'Carrera 8 # 4-44');
INSERT INTO CLIENTE VALUES (555, 'José Maria Florez', 3127, 'jomafl@gmail.com', 'Calle 2 # 4-26');



-- 5 DIFERENTES SERVICIOS --
INSERT INTO SERVICIO (cod_servicio, tipo_servicio, valor_servicio) VALUES (00221, 'Belleza Corporal ', 0);
INSERT INTO SERVICIO (cod_servicio, tipo_servicio, valor_servicio) VALUES (002, 'Masajes ',150000);
INSERT INTO SERVICIO (cod_servicio, tipo_servicio, valor_servicio) VALUES (003, 'Exfoliación ',30000);
INSERT INTO SERVICIO (cod_servicio, tipo_servicio, valor_servicio) VALUES (004, 'envolturas ',100000);
INSERT INTO SERVICIO (cod_servicio, tipo_servicio, valor_servicio) VALUES (005, 'Tratamientos Corporales ' ,250000);


-- SOLO HAY DOS EMPLEADOS PARA LOS INSERT --
INSERT INTO EMPLEADO (cod_empleado, nom_empleado, tele_empleado) VALUES (1001,' Marta Lucia Ortega Jaimes ' ,31145);
INSERT INTO EMPLEADO (cod_empleado,nom_empleado,tele_empleado) VALUES (1002,  'Maria Camila Ruiz ',35678);


--SALAS  DENTRO DE EL ESTABECIMIENTO--

INSERT INTO SALA (cod_sala,nom_sala,tipo_sala,cant_pers_sala) VALUES (012, 'SALA DE MASAJES','Corporal',3);
INSERT INTO SALA (cod_sala,nom_sala,tipo_sala,cant_pers_sala) VALUES (013, 'SAUNA','Especifica',4);
INSERT INTO SALA (cod_sala,nom_sala,tipo_sala,cant_pers_sala) VALUES (014, 'JACUZZI','Especifica',4);
INSERT INTO SALA (cod_sala,nom_sala,tipo_sala,cant_pers_sala) VALUES (015, 'DUCHAS','Corporal',3);
INSERT INTO SALA (cod_sala,nom_sala,tipo_sala,cant_pers_sala) VALUES (016, 'BAÑOS','Especifica',4); 


--LAS RESERVAS SE HACEN DEPENIENDO LAS HORAS--
INSERT INTO RESERVA  VALUES (131,'2019-08-30','13:30','500',111, 1001, 001, 012);
INSERT INTO RESERVA  VALUES (122,'2019-08-30','13:30','500',222, 1002, 002, 016);
INSERT INTO RESERVA  VALUES (221,'2019-08-30','13:30','500',333, 1001, 003, 014);
INSERT INTO RESERVA  VALUES (331,'2019-08-30','13:30','500',444, 1002, 004, 015);


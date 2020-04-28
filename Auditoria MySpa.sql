
---Tabla Auditoria: Cliente ---

CREATE TABLE AUD_CLIENTE (
aud_cod_cliente INTEGER NOT NULL,
aud_nom_cliente VARCHAR (100)NOT NULL,
aud_tele_cliente INTEGER  NOT NULL,
aud_correo_cliente VARCHAR(100) NOT NULL,
aud_dire_cliente VARCHAR (30) NOT NULL,
aud_operacion VARCHAR NULL,
aud_hora time with time zone null,
aud_usuario varchar 	
	

--------------TRIGGER CLIENTE AUDITORIA INSERTAR-------------
CREATE OR REPLACE FUNCTION
aud_I_cliente()
RETURNS TRIGGER AS
$BODY$ begin

INSERT INTO  AUD_CLIENTE( aud_cod_cliente, aud_nom_cliente, aud_tele_cliente, aud_correo_cliente, aud_dire_cliente, aud_operacion, aud_hora, aud_usuario)
		  VALUES( new.cod_cliente, new.nom_cliente, new.tele_cliente, new.correo_cliente, new.dire_cliente, 'I',
			current_timestamp, current_user);
return new;
end;
$BODY$
LANGUAGE plpgsql

CREATE TRIGGER "TR_aud_I_cliente"
AFTER INSERT
ON CLIENTE
FOR EACH ROW
EXECUTE PROCEDURE aud_I_cliente();


--------------TRIGGER CLIENTE AUDITORIA DELETE-------------
CREATE OR REPLACE FUNCTION
aud_D_cliente()
RETURNS TRIGGER AS
$BODY$ begin

INSERT INTO  AUD_CLIENTE( aud_cod_cliente, aud_nom_cliente, aud_tele_cliente, aud_correo_cliente, aud_dire_cliente,  aud_operacion, aud_hora, aud_usuario)
		  VALUES( old.cod_cliente, old.nom_cliente, old.tele_cliente, old.correo_cliente, old.dire_cliente, 'D',
			current_timestamp, current_user);
	

return old;
end;
$BODY$
LANGUAGE plpgsql
 
CREATE TRIGGER "TR_aud_D_cliente"
BEFORE DELETE
ON CLIENTE
FOR EACH ROW
EXECUTE PROCEDURE aud_D_cliente();

--------------TRIGGER CLIENTE AUDITORIA UPDATE-------------
CREATE OR REPLACE FUNCTION
aud_U_cliente()
RETURNS TRIGGER AS
$BODY$ begin


INSERT INTO  AUD_CLIENTE( aud_cod_cliente, aud_nom_cliente, aud_tele_cliente, aud_correo_cliente, aud_dire_cliente,aud_operacion, aud_hora, aud_usuario)
		  VALUES( old.cod_cliente, old.nom_cliente, old.tele_cliente, old.correo_cliente, old.dire_cliente, 'U',
			current_timestamp, current_user);

return new;
end;

$BODY$
LANGUAGE plpgsql
 
CREATE TRIGGER "TR_aud_U_cliente"
AFTER UPDATE
ON CLIENTE
FOR EACH ROW
EXECUTE PROCEDURE aud_U_cliente();

------SERVICIO----
-----Tabla Auditoria-----

CREATE TABLE AUD_SERVICIO (
aud_cod_servicio INTEGER NOT NULL,
aud_cod_cliente INTEGER NOT NULL,
aud_tipo_servicio VARCHAR (100) NOT NULL,
aud_valor_servicio INTEGER NOT NULL,	
aud_operacion VARCHAR NULL,
aud_hora time with time zone null,
aud_usuario varchar 

);

--------------TRIGGER SERVICIO  AUDITORIA INSERTAR-------------
CREATE OR REPLACE FUNCTION
aud_I_servicio()
RETURNS TRIGGER AS
$BODY$ begin

INSERT INTO  AUD_SERVICIO( aud_cod_servicio, aud_cod_cliente, aud_tipo_servicio, aud_valor_servicio, aud_operacion, aud_hora, aud_usuario)
		  VALUES( new.cod_servicio, new.cod_cliente,  new.aud_tipo_servicio, new.aud_valor_servicio, 'I',
			current_timestamp, current_user);
	

return new;
end;
$BODY$
LANGUAGE plpgsql

CREATE TRIGGER "TR_aud_I_servicio"
AFTER INSERT
ON SERVICIO
FOR EACH ROW
EXECUTE PROCEDURE aud_I_servicio();


--------------TRIGGER SERVICIO AUDITORIA DELETE-------------
CREATE OR REPLACE FUNCTION
aud_D_servicio()
RETURNS TRIGGER AS
$BODY$ begin

INSERT INTO  AUD_SERVICIO( aud_cod_servicio, aud_cod_cliente, aud_tipo_servicio, aud_valor_servicio, aud_operacion, aud_hora, aud_usuario)
		  VALUES( new.cod_servicio, new.cod_cliente,  new.aud_tipo_servicio, new.aud_valor_servicio, 'D',
			current_timestamp, current_user);

return old;
end;
$BODY$
LANGUAGE plpgsql
 
CREATE TRIGGER "TR_aud_D_servicio"
BEFORE DELETE
ON SERVICIO
FOR EACH ROW
EXECUTE PROCEDURE aud_D_servicio();

--------------TRIGGER SERVICIO AUDITORIA UPDATE-------------
CREATE OR REPLACE FUNCTION
aud_U_servicio()
RETURNS TRIGGER AS
$BODY$ begin


INSERT INTO  AUD_SERVICIO( aud_cod_servicio, aud_cod_cliente, aud_tipo_servicio, aud_valor_servicio, aud_operacion, aud_hora, aud_usuario)
		  VALUES( new.cod_servicio, new.cod_cliente,  new.aud_tipo_servicio, new.aud_valor_servicio, 'U',
			current_timestamp, current_user);


return new;
end;

$BODY$
LANGUAGE plpgsql
 
CREATE TRIGGER "TR_aud_U_servicio"
AFTER UPDATE
ON SERVICIO 
FOR EACH ROW
EXECUTE PROCEDURE aud_U_servicio ();
	
	
-----RESERVA---
---Tabla Auditoria ---

CREATE TABLE AUD_RESERVA (
aud_cod_reserva INTEGER NOT NULL,
aud_fecha_reseva DATE NOT NULL,
aud_hora_reserva TIME NOT NULL,
aud_precio_reserva INTEGER NOT NULL,
aud_cod_cliente INTEGER NOT NULL,
aud_cod_empleado INTEGER  NOT NULL,
aud_cod_servicio INTEGER NOT NULL,
aud_cod_sala INTEGER NOT NULL,
aud_operacion VARCHAR NULL,
aud_hora time with time zone null,
aud_usuario varchar 	
		
	
	
--------------TRIGGER RESERVA AUDITORIA INSERTAR-------------
CREATE OR REPLACE FUNCTION
aud_I_reserva()
RETURNS TRIGGER AS
$BODY$ begin

INSERT INTO  AUD_CLIENTE( aud_cod_reserva, aud_fecha_reseva, aud_hora_reserva, aud_precio_reserva, aud_cod_cliente, aud_cod_empleado,
					aud_cod_servicio, aud_cod_sala, aud_operacion, aud_hora, aud_usuario)			
		  VALUES( new.cod_reserva, new.fecha_reseva, new.hora_reserva, new.precio_reserva, new.cod_cliente, new.cod_empleado, new.cod_servicio,
				 new.cod_sala, 'I',
			current_timestamp, current_user);
	
return new;
end;
$BODY$
LANGUAGE plpgsql

CREATE TRIGGER "TR_aud_I_reserva"
AFTER INSERT
ON RESERVA
FOR EACH ROW
EXECUTE PROCEDURE aud_I_reserva();


--------------TRIGGER EMPLEADO AUDITORIA DELETE-------------
CREATE OR REPLACE FUNCTION
aud_D_reserva()
RETURNS TRIGGER AS
$BODY$ begin



INSERT INTO  AUD_CLIENTE( aud_cod_reserva, aud_fecha_reseva, aud_hora_reserva, aud_precio_reserva, aud_cod_cliente, aud_cod_empleado,
					aud_cod_servicio, aud_cod_sala, aud_operacion, aud_hora, aud_usuario)			
		  VALUES( new.cod_reserva, new.fecha_reseva, new.hora_reserva, new.precio_reserva, new.cod_cliente, new.cod_empleado, new.cod_servicio,
				 new.cod_sala, 'D',
			current_timestamp, current_user);
	
return old;
end;
$BODY$
LANGUAGE plpgsql
 
CREATE TRIGGER "TR_aud_D_reserva"
BEFORE DELETE
ON RESERVA
FOR EACH ROW
EXECUTE PROCEDURE aud_D_reserva();

--------------TRIGGER EMPLEADO AUDITORIA UPDATE-------------
CREATE OR REPLACE FUNCTION
aud_U_reserva()
RETURNS TRIGGER AS
$BODY$ begin

INSERT INTO  AUD_CLIENTE( aud_cod_reserva, aud_fecha_reseva, aud_hora_reserva, aud_precio_reserva, aud_cod_cliente, aud_cod_empleado,
					aud_cod_servicio, aud_cod_sala, aud_operacion, aud_hora, aud_usuario)			
		  VALUES( new.cod_reserva, new.fecha_reseva, new.hora_reserva, new.precio_reserva, new.cod_cliente, new.cod_empleado, new.cod_servicio,
				 new.cod_sala, 'U',
			current_timestamp, current_user);


return new;
end;

$BODY$
LANGUAGE plpgsql
 
CREATE TRIGGER "TR_aud_U_reserva"
AFTER UPDATE
ON RESERVA
FOR EACH ROW
EXECUTE PROCEDURE aud_U_reserva();

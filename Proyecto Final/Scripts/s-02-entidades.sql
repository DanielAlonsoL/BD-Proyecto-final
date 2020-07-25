--@Autor: Alonso Lopez Daniel
--		  Marcelino Cisneros Eduardo
--@Fecha creación: 04/12/2019
--@Descripción: Creación de tablas del caso de studio: Pharmacy Online


prompt Conectando usuario admin y creando tablas
connect am_proy_admin/daniel

create table centro_operaciones(
	centro_operaciones_id 	number(10,0) 	constraint centro_operaciones_pk primary key,
	clave 					varchar2(6) 	not null constraint co_clave_uk unique,
	direccion 				varchar2(60) 	not null,
	num_telefonico 			number(15,0)	not null,
	es_farmacia 			number(1,0) 	not null,
	es_almacen 				number(1,0) 	not null,
	es_oficina 				number(1,0) 	not null,
	constraint co_tipo_co_chk check(
		(es_farmacia = 1 and es_almacen = 1 and es_oficina = 0) or
		(es_farmacia = 1 and es_almacen = 0 and es_oficina = 0) or
		(es_farmacia = 0 and es_almacen = 1 and es_oficina = 0) or
		(es_farmacia = 0 and es_almacen = 0 and es_oficina = 1)
	)
);

create table empleado(
	empleado_id				number(10,0) 		constraint empleado_id_pk primary key,
	nombre 					varchar2(40) 		not null,
	ap_paterno  			varchar2(40) 		not null,
	ap_materno  			varchar2(40) 		not null,
	rfc 				 	varchar2(13) 		not null,
	fecha_ingreso 	     	date default sysdate,
	centro_operaciones_id 	number(10,0) 		not null,
	constraint emp_centro_operaciones_id_fk foreign key(centro_operaciones_id)
	references centro_operaciones(centro_operaciones_id)
);

create table farmacia(
	centro_operaciones_id 	number(10,0) 	constraint farmacia_pk primary key,
	rfc_fiscal				varchar2(13) 	not null,
	direccion_web			varchar2(40)	not null,
	empleado_id				number(10,0)	not null,
	constraint co_farmacia_co_id foreign key(centro_operaciones_id) 
	references centro_operaciones(centro_operaciones_id),
	constraint emp_farmacia_empleado_id foreign key(empleado_id)
	references empleado(empleado_id)
);

create table almacen(
	centro_operaciones_id 	number(10,0)	constraint almacen_pk primary key,
	capacidad				number(10,2)	not null,
	tipo_almacen			varchar2(1)		not null,
	informacion				BLOB			not null,
	almacen_contigencia_id	number(10,0)	null,
	constraint co_almacen_co_id foreign key(centro_operaciones_id) 
	references centro_operaciones(centro_operaciones_id),
	constraint almacen_contigencia_id foreign key(almacen_contigencia_id)
	references almacen(centro_operaciones_id),
	constraint almacen_tipo_almacen_chk check(
		tipo_almacen in('C','M','D')
		)
);

create table oficina(
	centro_operaciones_id	number(10,0) 	constraint oficina_pk primary key,
	num_telefonico			number(15,0) 	not null,
	nombre					varchar2(40)	not null,
	clave 					varchar2(30)	not null,
	constraint co_oficina_co_id foreign key(centro_operaciones_id) 
	references centro_operaciones(centro_operaciones_id)
);

create table medicamento(
	medicamento_id 			number(10,0) 	constraint medicamento_pk primary key,
	sustancia_activa		varchar2(40) 	not null,
	descripcion				varchar2(60) 	not null
);

create table farmacia_medicamento(
	farmacia_medicamento_id number(10,0)	constraint farmacia_medicamento_pk primary key,
	cantidad				number(10,0)	not null,
	medicamento_id 			number(10,0)	not null constraint far_med_medicamento_id_fk 
	references medicamento(medicamento_id),
	centro_operaciones_id 			number(10,0)	not null constraint far_med_farmacia_id_fk
	references farmacia(centro_operaciones_id)
);

create table nombre_medicamento(
	nombre_medicamento_id	number(10,0)	constraint nombre_medicamento_pk primary key,
	clave 					varchar2(3)		not null constraint nm_clave_uk unique,
	nombre_medicamento 		varchar2(40)	not null,
	medicamento_id 			number(10,0)	not null constraint nom_med_medicamento_id_fk 
	references medicamento(medicamento_id)
);

create table presentacion(
	presentacion_id 		number(10,0)	constraint presentacion_pk primary key,
	clave 					varchar2(3)		not null constraint presentacion_clave_uk unique,
	nombre 					varchar2(40) 	not null,
	descripcion				varchar2(40)	not null
);

create table presentacion_medicamento(
	presentacion_medicamento_id		number(10,0)	constraint presentacion_medicamento_pk primary key,
	presentacion_id 				number(10,0)	not null constraint pres_med_presentacion_id_fk 
	references presentacion(presentacion_id),
	medicamento_id 					number(10,0) 	not null constraint pres_med_medicamento_id_fk 
	references medicamento(medicamento_id)
);

create table status_pedido(
	status_pedido_id 		number(10,0)		constraint status_pedido_id_pk primary key,
	clave 					varchar(3) 	 		not null constraint sp_clave_uk unique,
	descripcion 			varchar2(60) 		not null
);

create table ubicacion_pedido(
	ubicacion_pedido_id 	number(10,0) 		constraint ubicacion_pedido_id_pk primary key,
	latitud  				varchar2(10) 		not null,
	longitud 				varchar2(10) 		not null
);

create table tarjeta_cliente(
	tarjeta_cliente_id 		number(10,0) 		constraint tarjeta_cliente_id_pk primary key,
	num_tarjeta 			varchar2(16) 		not null,
	mes_expira				number(2) 			not null,
	anio_expira				number(15) 			not null
);

create table cliente(
	cliente_id 				number(10,0) 	constraint cliente_id_pk primary key,
	nombre 					varchar2(40)  	not null,
	ap_paterno  			varchar2(40)  	not null,
	ap_materno  			varchar2(40)  	not null,
	curp		  			varchar2(18)  	not null constraint cliente_curp_uk unique,
	num_telefono			number(15)   	not null,
	direccion_envio			varchar2(60)  	not null,
	email					varchar2(40)  	null constraint cliente_email_uk unique,
	rfc 				 	varchar2(13)  	null constraint cliente_rfc_uk unique,
	tarjeta_cliente_id 		number(10,0) 	not null,
	constraint tarjeta_cliente_fk foreign key(tarjeta_cliente_id)
	references tarjeta_cliente(tarjeta_cliente_id),
	constraint cliente_email_chk check(
		email like '%@%'
		)
);

create table pedido(
	pedido_id 				number(10,0) 	constraint pedido_id_pk primary key,
	fecha_status 			date default sysdate,
	folio 					varchar(13)   	not null constraint pedido_folio_uk unique,
	importe_total			number(10,2)	not null,
	responsable_empleado_id number(10,2) 	not null,
	ubicacion_pedido_id		number(10,2) 	not null,
	status_pedido_id		number(10,2) 	not null,
	cliente_id				number(10,2) 	not null,
	constraint em_responsable_empleado_id_fk foreign key(responsable_empleado_id)
	references empleado(empleado_id),
	constraint up_ubicacion_pedido_id_fk foreign key(ubicacion_pedido_id)
	references ubicacion_pedido(ubicacion_pedido_id),
	constraint sp_status_pedido_id_fk foreign key(status_pedido_id)
	references status_pedido(status_pedido_id),
	constraint c_cliente_id_fk foreign key(cliente_id)
	references cliente(cliente_id)
);

create table historico_status_pedido(
	historico_status_pedido_id 				number(10,0) constraint historico_status_pedido_id_pk primary key,
	fecha_status 	 						date default sysdate,
	pedido_id 		 						number(10,0) not null,
	status_pedido_id 						number(10,0) not null,
	constraint hsp_pedido_id_fk foreign key(pedido_id)
	references pedido(pedido_id),
	constraint status_pedido_fk foreign key(status_pedido_id)
	references status_pedido(status_pedido_id)
);

create table detalle_pedido(
	detalle_pedido_id 			number(10,0) constraint detalle_pedido_id_pk primary key,
	cantidad 					number(10,0) not null,
	precio_unitario				number(10,2) not null,
	importe_articulo			as (trunc(cantidad*precio_unitario,2)) virtual,
	centro_operaciones_id 		number(10,0) not null,
	pedido_id 					number(10,0) not null,
	presentacion_medicamento_id number(10,0) not null,
	constraint dp_centro_operaciones_id_fk foreign key(centro_operaciones_id)
	references farmacia(centro_operaciones_id),
	constraint pedido_fk foreign key(pedido_id)
	references pedido(pedido_id),
	constraint presentacion_medicamento_fk foreign key(presentacion_medicamento_id)
	references presentacion_medicamento(presentacion_medicamento_id)
);

create table evento(
	evento_id 					number(10,0) 	constraint evento_id_pk primary key,
	fecha						date 		  	not null,
	tipo_evento 				varchar2(10)  	not null,
	almacen_id 					number(10,0) 	not null,
	responsable_empleado_id 	number(10,0) 	not null,
	constraint almacen_fk foreign key(almacen_id)
	references almacen(centro_operaciones_id),
	constraint responsable_empleado_fk foreign key(responsable_empleado_id)
	references empleado(empleado_id)
);

create table detalle_evento(
	detalle_evento_id 				number(10,0) 	not null constraint detalle_evento_id_pk primary key,
	cantidad 						number(10,0) 	not null,
	evento_id 						number(10,0) 	not null,
	presentacion_medicamento_id 	number(10,0) 	not null,
	constraint evento_fk foreign key(evento_id)
	references evento(evento_id),
	constraint de_medicamento_id_fk foreign key(presentacion_medicamento_id)
	references presentacion_medicamento(presentacion_medicamento_id)
);

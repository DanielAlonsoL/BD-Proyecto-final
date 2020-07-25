--@Autor: Alonso Lopez Daniel
--		  Marcelino Cisneros Eduardo
--@Fecha creación: 04/12/2019
--@Descripción: Creación de indices para llaves foraneas, atributos más buscados, etc

connect am_proy_admin/daniel

------------------------------------------------------------------------------------------------------------
--se indexa tipo_almacen de la tabla almacen
create index al_tipo_almacen_ix on almacen(tipo_almacen);

--se indexa la sustancia activa de cada medicamento
create unique index me_sustancia_activa_ix on medicamento(sustancia_activa);

--generalmente se realizan busquedas por los ultimos 5 caracteres del rfc del empleado
create index empleado_rfc_ix on empleado(substr(rfc,-1,5));

--se indexa la fk de almacen de contigencia en la tabla almacen
create index al_almacen_contigencia_id_ix on almacen(almacen_contigencia_id);

--se indexa la fk centro_operaciones_id en la tabla empleado
create index empleado_co_id_ix on empleado(centro_operaciones_id);

--se indexan las fk en presentacion_medicamento
create index pm_pres_med_id_ix on presentacion_medicamento(presentacion_id,medicamento_id);

--se indexa la fk de tarjeta_cliente en cliente
create index c_tarjeta_cliente_id_ix on cliente(tarjeta_cliente_id);

--se indexa las fk en la tabla pedido
create index pedido_fks_ix on pedido(responsable_empleado_id,ubicacion_pedido_id,status_pedido_id);
create index pedido_cliente_id_ix on pedido(cliente_id);

--se indexan las fk en la tabla historico_status_pedido
create index hsp_pedido_id_ix on historico_status_pedido(pedido_id);
create index hsp_status_pedido_id_ix on historico_status_pedido(status_pedido_id);

--se indexan las fk en la tabla detalle_pedido
create index dp_centro_operaciones_id_ix on detalle_pedido(centro_operaciones_id);
create index dp_pedido_id_ix on detalle_pedido(pedido_id);
create index dp_presentacion_medicamento_id_ix on detalle_pedido(presentacion_medicamento_id);

--se indexan las fk en la tabla evento
create index ev_almacen_id_ix on evento(almacen_id);
create index ev_responsable_empleado_ix on evento(responsable_empleado_id);

--se indexan las fk en la tabla detalle_evento
create index de_evento_id_ix on detalle_evento(evento_id);
create index de_presentacion_medicamento_id on detalle_evento(presentacion_medicamento_id);


------------------------------------------------------------------------------------------------------------

--se indexa el campo direccion es unico para cada centro de operaciones
create unique index co_direccion_iuk on centro_operaciones(direccion);

--generalmente se realizan busquedas por los primeros 5 caracteres del rfc_fiscal de la farmacia
create unique index farmacia_rfx_fiscal_iuk on farmacia(substr(rfc_fiscal,0,5));

--se indexa la columna rfc en la tabla empleado, es unico para cada empleado
create unique index empleado_rfc_iuk on empleado(rfc);

--se indexa la fk de empleado_id en la tabla farmacia
create unique index fa_empleado_id_iuk on farmacia(empleado_id);

--se indexa la clave de la tabla oficina
create unique index of_clave_iuk on oficina(clave);

--se indexa el nombre de oficina, frecuentemente se hacen busquedas sin importar si esta en mayusculas o minusculas
create unique index of_nombre_iuk on oficina(lower(nombre));

--se indexa la fk del medicamento_id en nombre_medicamento
create unique index nm_medicamento_id_iuk on nombre_medicamento(medicamento_id);

--se indexa num_tarjeta en tarjeta_cliente
create unique index tc_num_tarjeta_iuk on tarjeta_cliente(num_tarjeta);





--@Autor: Alonso Lopez Daniel
--		  Marcelino Cisneros Eduardo
--@Fecha creación: 04/12/2019
--@Descripción: Creación de vistas para cliente
--				Se otorga permisos a usuario invitado para lectura de vistas

prompt Conectando usuario admin y creando secuencias
connect am_proy_admin/daniel;

create view info_compra as
	select p.pedido_id, dp.cantidad, dp.precio_unitario,
		dp.importe_articulo, c.cliente_id
	from detalle_pedido dp, cliente c, pedido p
	where p.pedido_id=dp.pedido_id
	and p.cliente_id=c.cliente_id;

grant select on info_compra to am_proy_invitado;

create view info_pedido as
	select p.pedido_id,p.responsable_empleado_id, up.latitud, up.longitud,
		sp.descripcion
	from pedido p, ubicacion_pedido up, status_pedido sp
	where p.ubicacion_pedido_id=up.ubicacion_pedido_id
	and p.status_pedido_id=sp.status_pedido_id;

grant select on info_pedido to am_proy_invitado;

create view medicamento_disponible as
	select nm.nombre_medicamento,m.sustancia_activa,m.descripcion,
		fm.cantidad, fm.centro_operaciones_id
	from nombre_medicamento nm, medicamento m, farmacia_medicamento fm
	where nm.medicamento_id=m.medicamento_id
	and fm.medicamento_id=m.medicamento_id;

grant select on medicamento_disponible to am_proy_invitado;
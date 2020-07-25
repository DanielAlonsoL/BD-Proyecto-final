--CENTRO_OPERACIONES: FARMACIAS
insert into centro_Operaciones (centro_operaciones_id, clave, direccion, num_telefono, es_farmacia, es_almacen, es_oficina)
	values (seq_centro_operaciones.nextval,'F001','Iztapalapa',5576691311,1,0,0);
insert into Empleado (Empleado_id, nombre, ap_paterno, ap_materno, rfc, fecha_ingreso, centro_operaciones_id)
	values (seq_empleado.nextval,'Felipe', 'Perez','Leon', 'PELF081295FCD',to_date('01/03/2014','dd/mm/yyyy'), seq_centro_operaciones.currval);
insert into farmacia (centro_operaciones_id, rfc_fiscal, direccion_web, empleado_id)
	values (seq_centro_operaciones.currval,'FAR0718363','www.farmarcia-online.com/01',seq_empleado.currval);

insert into centro_Operaciones (centro_operaciones_id, clave, direccion, num_telefono, es_farmacia, es_almacen, es_oficina)
	values (seq_centro_operaciones.nextval,'F002','Nezahualcoyotl',5526135046,1,0,0);
insert into Empleado (Empleado_id, nombre, ap_paterno, ap_materno, rfc, fecha_ingreso, centro_operaciones_id)
	values (seq_empleado.nextval,'Edwin','Gonzalez','Martinez','GOME081199JRF',to_date('02/03/2014', 'dd/mm/yyyy'),seq_centro_operaciones.currval);
insert into farmacia (centro_operaciones_id, rfc_fiscal, direccion_web, empleado_id)
	values (seq_centro_operaciones.currval,'FAR0918347','www.farmarcia-online.com/02',seq_empleado.currval);

insert into centro_Operaciones (centro_operaciones_id, clave, direccion, num_telefono, es_farmacia, es_almacen, es_oficina)
	values (seq_centro_operaciones.nextval,'F003','Iztapalapa',5550462377,1,0,0);
insert into Empleado (Empleado_id, nombre, ap_paterno, ap_materno, rfc, fecha_ingreso, centro_operaciones_id)
	values (seq_empleado.nextval,'Roberto','Firmino','Paez','FIPR031097KJF',to_date('01/03/2014','dd/mm/yyyy'),seq_centro_operaciones.currval);
insert into farmacia (centro_operaciones_id, rfc_fiscal, direccion_web, empleado_id)
	values (seq_centro_operaciones.currval,'FAR0118547','www.farmarcia-online.com/03',seq_empleado.currval);

--MEDICAMENTOS
insert into Presentacion (Presentacion_id, clave, nombre, descripcion)
	values (seq_presentacion.nextval,'FR','frasco','frasco de 10 ml');

insert into medicamento (medicamento_id, sustancia_activa, descripcion)
	values (seq_medicamento.nextval,'paracetamol','analgesico y antipiretico');

insert into Presentacion_Medicamento (Presentacion_Medicamento_id, Presentacion_id, Medicamento_id)
	values (seq_presentacion_medicamento.nextval,seq_presentacion.currval,seq_medicamento.currval);
insert into Nombre_Medicamento (Nombre_Medicamento_id, clave, Nombre_Medicamento, Medicamento_id)
	values (seq_nombre_medicamento.nextval,'PA','antidol',seq_medicamento.currval);

insert into Presentacion (Presentacion_id, clave, nombre, descripcion)
	values (seq_presentacion.nextval,'CA','caja','caja de 20 pastillas');
insert into Presentacion_Medicamento (Presentacion_Medicamento_id, Presentacion_id, Medicamento_id)
	values (seq_presentacion_medicamento.nextval,seq_presentacion.currval,seq_medicamento.currval);


--se inserta paracetamol en las tres farmacias	
insert into farmacia_medicamento (farmacia_medicamento_id, cantidad, Medicamento_id, centro_operaciones_id)
	values (seq_farmacia_medicamento.nextval,10,seq_medicamento.currval,1);
insert into farmacia_medicamento (farmacia_medicamento_id, cantidad, Medicamento_id, centro_operaciones_id)
	values (seq_farmacia_medicamento.nextval,20,seq_medicamento.currval,2);
insert into farmacia_medicamento (farmacia_medicamento_id, cantidad, Medicamento_id, centro_operaciones_id)
	values (seq_farmacia_medicamento.nextval,14,seq_medicamento.currval,3);


insert into medicamento (medicamento_id, sustancia_activa, descripcion)
	values (seq_medicamento.nextval,'azitromicina','antibiotico');
insert into Nombre_Medicamento (Nombre_Medicamento_id, clave, Nombre_Medicamento, Medicamento_id)
	values (seq_nombre_medicamento.nextval,'AZ','azitrom',seq_medicamento.currval);
insert into Presentacion_Medicamento (Presentacion_Medicamento_id, Presentacion_id, Medicamento_id)
	values (seq_presentacion_medicamento.nextval,1,seq_medicamento.currval);
insert into Presentacion_Medicamento (Presentacion_Medicamento_id, Presentacion_id, Medicamento_id)
	values (seq_presentacion_medicamento.nextval,seq_presentacion.currval,seq_medicamento.currval);

--se inserta azitromicina en las tres farmacias	
insert into farmacia_medicamento (farmacia_medicamento_id, cantidad, Medicamento_id, centro_operaciones_id)
	values (seq_farmacia_medicamento.nextval,20,seq_medicamento.currval,1);
insert into farmacia_medicamento (farmacia_medicamento_id, cantidad, Medicamento_id, centro_operaciones_id)
	values (seq_farmacia_medicamento.nextval,11,seq_medicamento.currval,2);
insert into farmacia_medicamento (farmacia_medicamento_id, cantidad, Medicamento_id, centro_operaciones_id)
	values (seq_farmacia_medicamento.nextval,8,seq_medicamento.currval,3);

insert into medicamento (medicamento_id, sustancia_activa, descripcion)
	values (seq_medicamento.nextval,'amoxicilina','antibiotico semisintetico');
insert into Nombre_Medicamento (Nombre_Medicamento_id, clave, Nombre_Medicamento, Medicamento_id)
	values (seq_nombre_medicamento.nextval,'CLA','clamoxin',seq_medicamento.currval);
insert into Presentacion_Medicamento (Presentacion_Medicamento_id, Presentacion_id, Medicamento_id)
	values (seq_presentacion_medicamento.nextval,1,seq_medicamento.currval);
insert into Presentacion_Medicamento (Presentacion_Medicamento_id, Presentacion_id, Medicamento_id)
	values (seq_presentacion_medicamento.nextval,seq_presentacion.currval,seq_medicamento.currval);

--se inserta amoxicilina en las tres farmacias
insert into farmacia_medicamento (farmacia_medicamento_id, cantidad, Medicamento_id, centro_operaciones_id)
	values (seq_farmacia_medicamento.nextval,19,seq_medicamento.currval,1);
insert into farmacia_medicamento (farmacia_medicamento_id, cantidad, Medicamento_id, centro_operaciones_id)
	values (seq_farmacia_medicamento.nextval,21,seq_medicamento.currval,2);
insert into farmacia_medicamento (farmacia_medicamento_id, cantidad, Medicamento_id, centro_operaciones_id)
	values (seq_farmacia_medicamento.nextval,30,seq_medicamento.currval,3);


--CENTRO_OPERACIONES: ALMACENES
insert into centro_Operaciones (centro_operaciones_id, clave, direccion, num_telefono, es_farmacia, es_almacen, es_oficina)
	values (seq_centro_operaciones.nextval,'A001','Iztapalapa',5512345678,0,1,0);
insert into Almacen (centro_operaciones_id, capacidad, tipo_almacen, informacion, almacen_contigencia_id)
	values (seq_centro_operaciones.currval,50,'M', null, null);
insert into Empleado (Empleado_id, nombre, ap_paterno, ap_materno, rfc, fecha_ingreso, centro_operaciones_id)
values (seq_empleado.nextval,'Billy','Batson','Smith','BABS023498JFD',to_date('02/03/2014','dd/mm/yyyy'),seq_centro_operaciones.currval);

insert into centro_Operaciones (centro_operaciones_id, clave, direccion, num_telefono, es_farmacia, es_almacen, es_oficina)
	values (seq_centro_operaciones.nextval,'A002','Coyoacan', 5555555555,0,1,0);
insert into Almacen (centro_operaciones_id, capacidad, tipo_almacen, informacion, almacen_contigencia_id)
	values (seq_centro_operaciones.currval,70,'C',null, null);
insert into Empleado (Empleado_id, nombre, ap_paterno, ap_materno, rfc, fecha_ingreso, centro_operaciones_id)
	values (seq_empleado.nextval,'Bruce','Wayne','Dash','WADB081299HFE',to_date('08/11/2013','dd/mm/yyyy'), seq_centro_operaciones.currval);

insert into centro_Operaciones (centro_operaciones_id, clave, direccion, num_telefono, es_farmacia, es_almacen, es_oficina)
	values (seq_centro_operaciones.nextval,'A003','Polanco',5523136667,0,1,0);
insert into Almacen (centro_operaciones_id, capacidad, tipo_almacen, informacion, almacen_contigencia_id)
	values (seq_centro_operaciones.currval,50,'C', null, null);

insert into Empleado (Empleado_id, nombre, ap_paterno, ap_materno, rfc, fecha_ingreso, centro_operaciones_id)
values (seq_empleado.nextval,'Maria','Jimenez','Rosas','DFVW127655RND',to_date('12/11/2014','dd/mm/yyyy'),seq_centro_operaciones.currval);
insert into Empleado (Empleado_id, nombre, ap_paterno, ap_materno, rfc, fecha_ingreso, centro_operaciones_id)
values (seq_empleado.nextval,'Alejandra','Ramirez','Rivas','GFDS235473JBD',to_date('02/01/2015','dd/mm/yyyy'),seq_centro_operaciones.currval);

--OFICINA
insert into centro_Operaciones (centro_operaciones_id, clave, direccion, num_telefono, es_farmacia, es_almacen, es_oficina)
	values (seq_centro_operaciones.nextval,'OFIO01','Chalco',5530700827,0,0,1);
insert into Oficina (centro_operaciones_id, num_telefono, nombre, clave)
	values (seq_centro_operaciones.currval,5530700827,'Oficina_1','OF-3048274643');
insert into Empleado (Empleado_id, nombre, ap_paterno, ap_materno, rfc, fecha_ingreso, centro_operaciones_id)
	values (seq_empleado.nextval,'Alejandro','Ramirez','Melquiades','HFRS235473JBD',to_date('02/01/2015','dd/mm/yyyy'),seq_centro_operaciones.currval);


insert into Tarjeta_cliente (tarjeta_cliente_id, num_tarjeta, mes_expira, anio_expira)
	values (seq_tarjeta_cliente.nextval,1234567890111213,11,23);
insert into Tarjeta_cliente (tarjeta_cliente_id, num_tarjeta, mes_expira, anio_expira)
	values (seq_tarjeta_cliente.nextval,2389766613327770,08,21);
insert into Tarjeta_cliente (tarjeta_cliente_id, num_tarjeta, mes_expira, anio_expira)
	values (seq_tarjeta_cliente.nextval,7473258631468434,07,23);

insert into Cliente (Cliente_id, nombre, ap_paterno, ap_materno, curp, num_telefono, direccion_envio, email, rfc, tarjeta_cliente_id)
	values (seq_cliente.nextval,'Jose', 'Perez', 'Leon','AOLD970602HMCLPN03',5576691311,'Iztapalapa, Colinia San Jose', 'josepl@gmail.com','PELJ123194HFD',1);
insert into Cliente (Cliente_id, nombre, ap_paterno, ap_materno, curp, num_telefono, direccion_envio, email, rfc, tarjeta_cliente_id)
	values (seq_cliente.nextval,'Luis','Alfonso','Cosio','AOLD970602HMCLPN02',5512936982,'Benito Juarez, Del Valle', 'elyak@gmail.com','ALCL936412FDD',2);
insert into Cliente (Cliente_id, nombre, ap_paterno, ap_materno, curp, num_telefono, direccion_envio, email, rfc, tarjeta_cliente_id)
	values (seq_cliente.nextval,'Carlos','Slim','Helu','AOLD970602HMCLPN09',5513135304,'Coyoacan, colonia La joya',null,null,3);

insert into Status_pedido (Status_pedido_id, clave, descripcion)
	values (seq_status_pedido.nextval,'CAP','CAPTURADO');
insert into Status_pedido (Status_pedido_id, clave, descripcion)
	values (seq_status_pedido.nextval,'TRA','EN TRANSITO');
insert into Status_pedido (Status_pedido_id, clave, descripcion)
	values (seq_status_pedido.nextval,'ENT','ENTREGADO');
insert into Status_pedido (Status_pedido_id, clave, descripcion)
	values (seq_status_pedido.nextval,'CAN','CANCELADO');
insert into Status_pedido (Status_pedido_id, clave, descripcion)
values (seq_status_pedido.nextval,'DEV','DEVUELTO');

insert into Ubicacion_pedido (Ubicacion_pedido_id, latitud, longitud)
	values (seq_ubicacion_pedido.nextval,'-60','60');
insert into Ubicacion_pedido (Ubicacion_pedido_id, latitud, longitud)
	values (seq_ubicacion_pedido.nextval,'-120','120');
insert into Ubicacion_pedido (Ubicacion_pedido_id, latitud, longitud)
	values (seq_ubicacion_pedido.nextval,'60','-60');
insert into Ubicacion_pedido (Ubicacion_pedido_id, latitud, longitud)
	values (seq_ubicacion_pedido.nextval,'120','-120');

insert into Pedido (pedido_id, fecha_status, folio, importe_total, responsable_empleado_id, Ubicacion_pedido_id, Status_pedido_id, Cliente_id)
	values (seq_pedido.nextval,to_date('12/02/2019','dd/mm/yyyy'),'1234',530.00,1,1,1,1);
insert into Pedido (pedido_id, fecha_status, folio, importe_total, responsable_empleado_id, Ubicacion_pedido_id, Status_pedido_id, Cliente_id)
	values (seq_pedido.nextval,to_date('12/10/2019','dd/mm/yyyy'),'2312',423.50,2,3,2,2);
insert into Pedido (pedido_id, fecha_status, folio, importe_total, responsable_empleado_id, Ubicacion_pedido_id, Status_pedido_id, Cliente_id)
	values (seq_pedido.nextval,to_date('21/06/2015','dd/mm/yyyy'),'0312',200.00,1,4,3,1);

insert into Historico_status_pedido (Historico_status_pedido_id, fecha_status, pedido_id, status_pedido_id)
	values (seq_historico_status_pedido.nextval,to_date('12/02/2019','dd/mm/yyyy'),1,1);
insert into Historico_status_pedido (Historico_status_pedido_id, fecha_status, pedido_id, status_pedido_id)
	values (seq_historico_status_pedido.nextval,to_date('12/10/2019','dd/mm/yyyy'),2,1);
insert into Historico_status_pedido (Historico_status_pedido_id, fecha_status, pedido_id, status_pedido_id)
	values (seq_historico_status_pedido.nextval,to_date('12/11/2019','dd/mm/yyyy'),2,2);
insert into Historico_status_pedido (Historico_status_pedido_id, fecha_status, pedido_id, status_pedido_id)
	values (seq_historico_status_pedido.nextval,to_date('12/05/2015','dd/mm/yyyy'),3,1);
insert into Historico_status_pedido (Historico_status_pedido_id, fecha_status, pedido_id, status_pedido_id)
	values (seq_historico_status_pedido.nextval,to_date('20/05/2015','dd/mm/yyyy'),3,2);
insert into Historico_status_pedido (Historico_status_pedido_id, fecha_status, pedido_id, status_pedido_id)
	values (seq_historico_status_pedido.nextval,to_date('01/06/2015','dd/mm/yyyy'),3,3);

--DETALLE PEDIDO
insert into detalle_pedido(detalle_pedido_id,cantidad,precio_unitario,centro_operaciones_id, pedido_id, presentacion_medicamento_id)
	values(seq_detalle_pedido.nextval,10,51.50,1,1,1);
insert into detalle_pedido(detalle_pedido_id,cantidad,precio_unitario,centro_operaciones_id, pedido_id, presentacion_medicamento_id)
	values(seq_detalle_pedido.nextval,5,29.99,1,1,2);
insert into detalle_pedido(detalle_pedido_id,cantidad,precio_unitario,centro_operaciones_id, pedido_id, presentacion_medicamento_id)
	values(seq_detalle_pedido.nextval,9,20.30,1,1,3);
insert into detalle_pedido(detalle_pedido_id,cantidad,precio_unitario,centro_operaciones_id, pedido_id, presentacion_medicamento_id)
	values(seq_detalle_pedido.nextval,3,14.75,1,1,4);
insert into detalle_pedido(detalle_pedido_id,cantidad,precio_unitario,centro_operaciones_id, pedido_id, presentacion_medicamento_id)
	values(seq_detalle_pedido.nextval,4,15.50,1,1,5);

insert into detalle_pedido(detalle_pedido_id,cantidad,precio_unitario,centro_operaciones_id, pedido_id, presentacion_medicamento_id)
	values(seq_detalle_pedido.nextval,7,19.80,1,2,1);
insert into detalle_pedido(detalle_pedido_id,cantidad,precio_unitario,centro_operaciones_id, pedido_id, presentacion_medicamento_id)
	values(seq_detalle_pedido.nextval,4,105.90,1,2,2);
insert into detalle_pedido(detalle_pedido_id,cantidad,precio_unitario,centro_operaciones_id, pedido_id, presentacion_medicamento_id)
	values(seq_detalle_pedido.nextval,5,55.50,1,2,3);
insert into detalle_pedido(detalle_pedido_id,cantidad,precio_unitario,centro_operaciones_id, pedido_id, presentacion_medicamento_id)
	values(seq_detalle_pedido.nextval,9,35.50,1,2,4);

insert into detalle_pedido(detalle_pedido_id,cantidad,precio_unitario,centro_operaciones_id, pedido_id, presentacion_medicamento_id)
	values(seq_detalle_pedido.nextval,3,30.50,2,3,1);
insert into detalle_pedido(detalle_pedido_id,cantidad,precio_unitario,centro_operaciones_id, pedido_id, presentacion_medicamento_id)
	values(seq_detalle_pedido.nextval,4,22.50,2,3,2);
insert into detalle_pedido(detalle_pedido_id,cantidad,precio_unitario,centro_operaciones_id, pedido_id, presentacion_medicamento_id)
	values(seq_detalle_pedido.nextval,7,21.50,2,3,3);

insert into detalle_pedido(detalle_pedido_id,cantidad,precio_unitario,centro_operaciones_id, pedido_id, presentacion_medicamento_id)
	values(seq_detalle_pedido.nextval,9,15.50,2,2,4);
insert into detalle_pedido(detalle_pedido_id,cantidad,precio_unitario,centro_operaciones_id, pedido_id, presentacion_medicamento_id)
	values(seq_detalle_pedido.nextval,9,19.50,2,2,5);

insert into detalle_pedido(detalle_pedido_id,cantidad,precio_unitario,centro_operaciones_id, pedido_id, presentacion_medicamento_id)
	values(seq_detalle_pedido.nextval,6,19.59,3,3,1);
insert into detalle_pedido(detalle_pedido_id,cantidad,precio_unitario,centro_operaciones_id, pedido_id, presentacion_medicamento_id)
	values(seq_detalle_pedido.nextval,11,11.99,3,3,4);
insert into detalle_pedido(detalle_pedido_id,cantidad,precio_unitario,centro_operaciones_id, pedido_id, presentacion_medicamento_id)
	values(seq_detalle_pedido.nextval,2,12.79,3,3,5);

--EVENTO
insert into evento (evento_id, fecha, tipo_evento, almacen_id, responsable_empleado_id)
	values (seq_evento.nextval,null,'salida',4,4);
insert into detalle_evento(detalle_evento_id,cantidad,evento_id,presentacion_medicamento_id) 
	values(seq_detalle_evento.nextval,20,seq_evento.currval,1);

insert into evento (evento_id, fecha, tipo_evento, almacen_id, responsable_empleado_id)
	values (seq_evento.nextval,null,'entrada',5,5);
insert into detalle_evento(detalle_evento_id,cantidad,evento_id,presentacion_medicamento_id) 
	values(seq_detalle_evento.nextval,30,seq_evento.currval,2);

insert into evento (evento_id, fecha, tipo_evento, almacen_id, responsable_empleado_id)
	values (seq_evento.nextval,null,'salida',6,6);
insert into detalle_evento(detalle_evento_id,cantidad,evento_id,presentacion_medicamento_id) 
	values(seq_detalle_evento.nextval,10,seq_evento.currval,3);
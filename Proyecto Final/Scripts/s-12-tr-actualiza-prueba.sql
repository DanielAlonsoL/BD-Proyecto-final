set serveroutput on


Prompt =======================================
Prompt TRIGGER 1
Prompt Prueba 1.
prompt Insertando un nuevo pedido
Prompt ========================================

insert into Pedido (pedido_id, fecha_status, folio, importe_total, reponsable_empleado_id, Ubicacion_pedido_id, Status_pedido_id, Cliente_id)
values(14,sysdate,'2412',1000, 1, 2, 1, 2);
commit;

Prompt OK, prueba 1 exitosa.


Prompt =======================================
Prompt Prueba 2.
prompt Actualizando pedido 
Prompt ========================================

update Pedido set Status_pedido_id = 2
where pedido_id = 14;

Prompt OK, prueba 2 exitosa.

Prompt =================================================
Prompt Prueba 3.
Prompt Modificando otra columna que no es el estatus
Prompt ==================================================

update Pedido set importe_total = 12112
where pedido_id = 14;

Prompt Tu pedido fue Actualizando pero no se agrego al Historico
Prompt OK, prueba 3 exitosa.
rollback;


Prompt =======================================
Prompt TRIGGER 2
Prompt Prueba 1
prompt Insertando un nuevo Detalle_pedido
Prompt ========================================


declare
	v_cantidad1 number;
	v_cantidad2 number;
begin

	select cantidad into v_cantidad1
	from Farmacia_Medicamento
	where centro_operaciones_id = 1
	and medicamento_id = (select medicamento_id
							from Presentacion_Medicamento
							where Presentacion_Medicamento_id = 2);

	insert into Detalle_Pedido (Detalle_Pedido_id, cantidad,precio_unitario, centro_operaciones_id, pedido_id, Presentacion_Medicamento_id)
	values (20, 5, 5, 1, 2, 2);

	select cantidad into v_cantidad2
	from Farmacia_Medicamento
	where centro_operaciones_id = 1
	and medicamento_id = (select medicamento_id
							from Presentacion_Medicamento
							where Presentacion_Medicamento_id = 2);

    if v_cantidad1 > v_cantidad2 then
    	dbms_output.put_line('OK, prueba 1 Exitosa.');
    else
    	dbms_output.put_line('ERROR, se obtuvo excepción no esperada');
    end if;
end;
/
commit;


Prompt =================================================
Prompt Prueba 2.
Prompt Actualizando cantidad mayor
Prompt =================================================

declare
	v_cantidad1 number;
	v_cantidad2 number;
begin

	select cantidad into v_cantidad1
	from Farmacia_Medicamento
	where centro_operaciones_id = 1
	and medicamento_id = (select medicamento_id
							from Presentacion_Medicamento
							where Presentacion_Medicamento_id = 2);

	update Detalle_Pedido set cantidad = 6
	where Detalle_Pedido_id = 20;

	select cantidad into v_cantidad2
	from Farmacia_Medicamento
	where centro_operaciones_id = 1
	and medicamento_id = (select medicamento_id
							from Presentacion_Medicamento
							where Presentacion_Medicamento_id = 2);

    if v_cantidad1 > v_cantidad2 then
    	dbms_output.put_line('OK, prueba 2 Exitosa.');
    else
    	dbms_output.put_line('ERROR, se obtuvo excepción no esperada');
    end if;
end;
/

Prompt =================================================
Prompt Prueba 3.
Prompt Actualizando cantidad menor
Prompt =================================================

declare
	v_cantidad1 number;
	v_cantidad2 number;
begin

	select cantidad into v_cantidad1
	from Farmacia_Medicamento
	where centro_operaciones_id = 1
	and medicamento_id = (select medicamento_id
							from Presentacion_Medicamento
							where Presentacion_Medicamento_id = 2);

	update Detalle_Pedido set cantidad = 5
	where Detalle_Pedido_id = 20;

	select cantidad into v_cantidad2
	from Farmacia_Medicamento
	where centro_operaciones_id = 1
	and medicamento_id = (select medicamento_id
							from Presentacion_Medicamento
							where Presentacion_Medicamento_id = 2);

    if v_cantidad1 < v_cantidad2 then
    	dbms_output.put_line('OK, prueba 3 Exitosa.');
    else
    	dbms_output.put_line('ERROR, se obtuvo excepción no esperada');
    end if;
end;
/

Prompt =================================================
Prompt Prueba 4.
Prompt Eliminando registro
Prompt =================================================

declare
v_cantidad1 number;
v_cantidad2 number;
begin

	select cantidad into v_cantidad1
	from Farmacia_Medicamento
	where centro_operaciones_id = 1
	and medicamento_id = (select medicamento_id
							from Presentacion_Medicamento
							where Presentacion_Medicamento_id = 2);

	delete from Detalle_Pedido 
	where Detalle_Pedido_id = 20;

	select cantidad into v_cantidad2
	from Farmacia_Medicamento
	where centro_operaciones_id = 1
	and medicamento_id = (select medicamento_id
							from Presentacion_Medicamento
							where Presentacion_Medicamento_id = 2);

    if v_cantidad1 < v_cantidad2 then
    	dbms_output.put_line('OK, prueba 4 Exitosa.');
    else
    	dbms_output.put_line('ERROR, se obtuvo excepción no esperada');
    end if;
end;

Prompt Prueba concluida, Haciendo Rollback para limpiar la BD.
rollback;
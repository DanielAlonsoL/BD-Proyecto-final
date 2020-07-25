prompt Creando trigger tr_historico
create or replace trigger tr_historico
	after insert or update of status_pedido_id
	on pedido
	for each row
declare
v_seq_hist number(10,0);
v_fecha_status date;
v_pedido_id number(10,0);
v_status_id number(10,0);

begin
	select seq_historico_status_pedido.nextval into v_seq_hist from dual;
	case
		when inserting then
			v_fecha_status:= :new.fecha_status;
			v_pedido_id := :new.pedido_id;
			v_status_id := :new.status_pedido_id;

			insert into historico_status_pedido (historico_status_pedido_id, fecha_status, pedido_id, status_pedido_id)
			values (v_seq_hist, v_fecha_status, v_pedido_id, v_status_id);

		when updating('status_pedido_id') then
			v_fecha_status:= :new.fecha_status;
			v_pedido_id := :new.pedido_id;
			v_status_id := :new.status_pedido_id;

			insert into Historico_status_pedido (Historico_status_pedido_id, fecha_status, pedido_id, status_pedido_id)
				values (v_seq_hist, v_fecha_status, v_pedido_id, v_status_id);
	end case;
end;
/ 
show errors 

create or replace trigger tr_Medicamento
	after insert
	or update of cantidad
	or delete
	on Detalle_Pedido
	for each row

declare
v_cantidad number;
begin
	case
		when inserting then 
			update Farmacia_Medicamento set cantidad = cantidad-:new.cantidad
			where centro_operaciones_id = :new.centro_operaciones_id
			and medicamento_id = (select medicamento_id
									from Presentacion_Medicamento
									where Presentacion_Medicamento_id = 
									:new.presentacion_medicamento_id);

		when updating('cantidad') then
			v_cantidad := :new.cantidad - :old.cantidad; 
			update Farmacia_Medicamento set cantidad = cantidad - v_cantidad
			where centro_operaciones_id = :new.centro_operaciones_id
			and medicamento_id = (select medicamento_id
									from Presentacion_Medicamento
									where Presentacion_Medicamento_id = 
									:new.presentacion_medicamento_id);
		when deleting then
		update Farmacia_Medicamento set cantidad = cantidad + :old.cantidad
		where centro_operaciones_id = :old.centro_operaciones_id
		and medicamento_id = (select medicamento_id
								from Presentacion_Medicamento
								where Presentacion_Medicamento_id = 
								:old.presentacion_medicamento_id);
	end case;
end;
/ 
show errors 

--create or replace trigger tr_
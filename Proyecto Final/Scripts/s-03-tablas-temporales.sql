--@Autor: Alonso Lopez Daniel
--		  Marcelino Cisneros Eduardo
--@Fecha creación: 04/12/2019
--@Descripción: Creación de tablas temporales

create global temporary table t_detalle_pedido(
	t_detalle_pedido_id 		number(10,0) constraint t_detalle_pedido_id_pk primary key,
	cantidad 					number(10,0) not null,
	precio_unitario				number(10,2) not null,
	importe_articulo			number(10,2) not null
) on commit preserve rows;

create or replace function calculaCantidad(
	p_id number
) return number is

	v_cantidad number;

	begin
		select pedido_id, sum(cantidad) into v_cantidad
		from detalle_pedido
		where pedido_id=p_id
		group by pedido_id;

		return v_cantidad;
	end;
	/

create or replace function calculaImporteTotal(
	p_id number
)	return number is 

	v_importe number;

	begin
		select pedido_id, sum(importe_articulo) into v_importe
		from detalle_pedido
		where pedido_id=p_id
		group by pedido_id;
	
		return v_importe;
	end;
	/

create global temporary table t_info_pedido(
	t_info_pedido_id 		number(10,0)	constraint t_info_pedido_pk primary key,
	pedido_id 				number(10,0)	not null,
	importe_total			number(10,0)	not null,
	cantidad_articulos		number(10,0)	not null
) on commit delete rows;

--@Autor: Alonso Lopez Daniel
--		  Marcelino Cisneros Eduardo
--@Fecha creación: 04/12/2019
--@Descripción: bloque anonimo que prueba lee_info
--				se prueba realizando un insert con un archivo txt
--				en la columna de informacion de la tabla almacen

prompt Conectando usuario y cargando biometricos
connect maal_ciudadano/maal_ciudadano
declare

v_almacen_id number(10,0);

v_seq_centro_operaciones number(10,0);
v_clave 	varchar2(6);
v_direccion varchar2(60);
type lista_direccion is table of varchar2(100);
v_lista_direccion lista_direccion;
v_num_telefono number(15,0);
v_es_farmacia number(1,0);
v_es_almacen number(1,0);
v_es_oficina number(1,0);

v_nombre_archivo varchar2(100);

begin
	dbms_output.put_line('Insertando un nuevo centro de operaciones que es almacen');
	
	--lista de nombres de calles para direccion
	select seq_centro_operaciones.nextval into v_seq_centro_operaciones from dual;
	insert into centro_Operaciones (centro_operaciones_id, clave, direccion, num_telefono, es_farmacia, es_almacen, es_oficina)
		values (v_seq_centro_operaciones,'A-PRU','Iztapalapa',551234546488,0,1,0);
	--se inserta un registro en almacen
	insert into Almacen (centro_operaciones_id, capacidad, tipo_almacen, informacion, almacen_contigencia_id)
		values (v_seq_centro_operaciones, 40,'M', read_blobs('almacen_prueba.txt'), null);

	commit;

end;
/
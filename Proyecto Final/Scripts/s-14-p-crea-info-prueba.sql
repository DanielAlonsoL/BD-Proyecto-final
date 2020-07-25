--@Autor: Alonso Lopez Daniel
--		  Marcelino Cisneros Eduardo
--@Fecha creación: 04/12/2019
--@Descripción: bloque anonimo que prueba crea_info_blob
--				por cada almacen que se introdujo en la carga inciial (3 almacenes)
--				se introduce su respectivo archivo txt en el atributo informacion

set serveroutput on

declare
v_almacen_id number(10,0);
v_nombre_archivo varchar2(100);

begin
	dbms_output.put_line('Iniciando carga de datos BLOB para cada almacen
		');
	for cont in 1..3 loop
		dbms_output.put_line('Probando crea_info_blob en almacen'||to_char(cont));
		v_almacen_id:=to_number(cont)+3;
		v_nombre_archivo:='almacen'||to_char(cont)||'.txt';
		crea_info_blob(v_almacen_id,v_nombre_archivo);
		dbms_output.put_line('Carga de BLOB para '||v_nombre_archivo||' finalizada 
			');
	end loop;


	commit;
exception
	when others then
	--algo salio mal, se aplica rollback
		dbms_output.put_line('Algo salio mal');
		rollback;

end;
/

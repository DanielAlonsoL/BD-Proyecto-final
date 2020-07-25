--@Autor: Alonso Lopez Daniel
--		  Marcelino Cisneros Eduardo
--@Fecha creación: 04/12/2019
--@Descripción: Creación de sinonimos

connect am_proy_admin/daniel

--creando sinonimos publicos que le pertencen al admin 
create or replace public synonym cliente for am_proy_admin.cliente;
create or replace public synonym pedido for am_proy_admin.pedido;
create or replace public synonym empleado for am_proy_admin.empleado;

--otorgando permisos de solo lectura a ciertas entidades
grant select on farmacia to am_proy_invitado;
grant select on almacen to am_proy_invitado;
grant select on oficina to am_proy_invitado;
	
connect am_proy_invitado/daniel
create or replace synonym farmacia for am_proy_admin.farmacia;
create or replace synonym almacen for am_proy_admin.almacen;
create or replace synonym oficina for am_proy_admin.oficina;

prompt conectando a usuario sys y creando sinonimos privados de cada tabla
connect sys/system1 as sysdba

set serveroutput on

spool create_sinonimos.sql;

-- declaracion de variables
declare
v_tabla varchar2(30);
v_sql varchar2(130);
cursor cur_tables is 
	select dt.table_name tablas
	from dba_tables dt
	where owner='AM_PROY_ADMIN';

begin 

	for t in cur_tables loop
		v_tabla:= t.tablas;
		v_sql:='create or replace synonym s_'||lower(v_tabla)||' for am_proy_admin.'||lower(v_tabla)||';';
		dbms_output.put_line(v_sql);
	end loop;
end;
/
spool off;

connect AM_PROY_ADMIN/daniel
@@create_sinonimos.sql

prompt sinonimos privados creados

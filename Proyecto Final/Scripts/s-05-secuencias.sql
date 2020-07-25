--@Autor: Alonso Lopez Daniel
--		  Marcelino Cisneros Eduardo
--@Fecha creación: 04/12/2019
--@Descripción: Creación de secuencias necesarias
--				para id's de tablas de proyecto
--				se automatiza con ayuda de un procedimiento

prompt Conectando usuario sys y creando secuencias
connect sys/system1 as sysdba

set serveroutput on

spool create_sequences.sql;

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
		v_sql:='create sequence seq_'||lower(v_tabla)||' start with 1 increment by 1 cache 20 nocycle;';
		dbms_output.put_line(v_sql);
	end loop;
end;
/
spool off;

connect AM_PROY_ADMIN/daniel
@@create_sequences.sql

prompt secuencias creadas

--@Autor: Alonso Lopez Daniel
--		  Marcelino Cisneros Eduardo
--@Fecha creación: 04/12/2019
--@Descripción: procedicimiento almacenado que crea informacion de la tabla almacen
set serveroutput on

connect sys/system1 as sysdba
create or replace directory data_dir as '/tmp/data';

grant read on directory data_dir to am_proy_admin;

prompt Conectando usuario admin y creando tablas
connect am_proy_admin/daniel

-- Asegurarse que el archivo txt se encuentra en el mismo
-- directorio donde se está ejecutando este script.
-- De lo contrario, el comando cp fallará.
prompt copiando el archivo txt a /tmp/data
!cp almacen1.txt /tmp/data
!cp almacen2.txt /tmp/data
!cp almacen3.txt /tmp/data

create or replace procedure crea_info_blob(p_almacen_id in number,
	p_nombre_archivo in varchar2) is
	
	v_id number;
	v_bfile bfile;
	v_src_offset number := 1;
	v_dest_offset number:= 1;
	v_dest_blob blob;
	v_src_length number;
	v_dest_length number;

begin
	v_bfile := bfilename('DATA_DIR',p_nombre_archivo);
	if dbms_lob.fileexists(v_bfile) = 1 and not dbms_lob.isopen(v_bfile) = 1 
		then dbms_lob.open(v_bfile,dbms_lob.lob_readonly);
	else
		raise_application_error(-20001,'El archivo '
		||p_nombre_archivo
		||' no existe en el directorio'
		||' o el archivo esta abierto');
	end if;
	
	v_id := p_almacen_id;

	update almacen set informacion = empty_blob() where centro_operaciones_id = v_id;
	commit;

	select informacion into v_dest_blob 
	from almacen
	where centro_operaciones_id = v_id
	for update;
	
	dbms_lob.loadblobfromfile(
		dest_lob => v_dest_blob,
		src_bfile => v_bfile,
		amount => dbms_lob.getlength(v_bfile),
		dest_offset => v_dest_offset,
		src_offset => v_src_offset);
	
		dbms_lob.close(v_bfile);

		v_src_length := dbms_lob.getlength(v_bfile);
		v_dest_length := dbms_lob.getlength(v_dest_blob);
	
	if v_src_length = v_dest_length then
		dbms_output.put_line('Escritura correcta, bytes escritos: '
		|| v_src_length);
	else
		raise_application_error(-20002,'Error al escribir datos.\n'
		||' Se esperaba escribir '||v_src_length
		||' Pero solo se escribio '||v_dest_length);
	end if;
end;
/
show errors
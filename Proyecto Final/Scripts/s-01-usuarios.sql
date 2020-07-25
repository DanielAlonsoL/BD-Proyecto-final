--@Autor: Alonso Lopez Daniel
--		  Marcelino Cisneros Eduardo
--@Fecha creación: 04/12/2019
--@Descripción: Creación de usuario proyecto final
--				se utilizo sql dinamico para la creacion de roles y usuarios


Prompt proporcione el password del usuario sys
connect sys/system1 as sysdba
-------------------------------------------------------------------------------------------------------------------------------
--Bloque que crea rol admin
-------------------------------------------------------------------------------------------------------------------------------
--permite la salida de mensajes a consula empleabo dbms_output.put_line
set serveroutput on
--declaracion de variable que almacena contador de admin_role
declare
v_count_admin_role number(1,0);
begin
	select count(*) into v_count_admin_role
	from dba_roles
	where role = 'PROY_ADMIN_ROL';

	if v_count_admin_role > 0 then
		dbms_output.put_line('Eliminando rol admin existente');
		execute immediate 'drop role proy_admin_rol';
	end if;
end;
/

prompt Creando rol admin
create role proy_admin_rol;
grant create session, create table, create procedure, create sequence, 
	create view, create trigger, create synonym, create public synonym to proy_admin_rol;


-------------------------------------------------------------------------------------------------------------------------------
--Bloque que crea rol invitado
-------------------------------------------------------------------------------------------------------------------------------
--declaracion de variable que almacena contador de invitado_role
declare
v_count_invitado_role number(1,0);
begin
	select count(*) into v_count_invitado_role
	from dba_roles
	where role = 'PROY_INVITADO_ROL';

	if v_count_invitado_role > 0 then
		dbms_output.put_line('Eliminando rol admin existente');
		execute immediate 'drop role proy_invitado_rol';
	end if;
end;
/

prompt Creando rol invitado
create role proy_invitado_rol;
grant create session, create synonym, create public synonym to proy_invitado_rol;

-------------------------------------------------------------------------------------------------------------------------------
--Bloque que crea usuario AM_PROY_ADMIN y asigna rol admin
-------------------------------------------------------------------------------------------------------------------------------

--este bloque anómimo valida la existencia del usuario, si existe lo elimina.
declare
v_count_admin number(1,0);
begin
	select count(*) into v_count_admin
	from dba_users
	where username = 'AM_PROY_ADMIN';

	if v_count_admin > 0 then
		dbms_output.put_line('Eliminando usuario existente');
		execute immediate 'drop user am_proy_admin cascade';
	end if;
end;
/

prompt asignando rol admin a am_proy_admin
create user am_proy_admin identified by daniel quota unlimited on users;
grant proy_admin_rol to am_proy_admin;

-------------------------------------------------------------------------------------------------------------------------------
--Bloque que crea usuario AM_PROY_INVITADO y asigna rol invitado
-------------------------------------------------------------------------------------------------------------------------------

--este bloque anómimo valida la existencia del usuario, si existe lo elimina.
declare
v_count_invitado number(1,0);
begin
	select count(*) into v_count_invitado
	from dba_users
	where username = 'AM_PROY_INVITADO';

	if v_count_invitado > 0 then
		dbms_output.put_line('Eliminando usuario existente');
		execute immediate 'drop user am_proy_invitado cascade';
	end if;
end;
/

prompt asignando rol invitado a am_proy_invitado
create user am_proy_invitado identified by daniel quota unlimited on users;
grant proy_invitado_rol to am_proy_invitado;

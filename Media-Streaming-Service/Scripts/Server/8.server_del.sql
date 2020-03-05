set serveroutput on;
set verify off;
	
begin
	dbms_output.put_line(chr(10)||'---SELECT TABLE TO DELETE FROM---');
	dbms_output.put_line(chr(10)||'1. Movies');
	dbms_output.put_line(chr(10)||'2. TV Shows');
	dbms_output.put_line(chr(10)||'3. Users');
end; 
/

set serveroutput on;
set verify off;

declare	
	id number;
	n number;
begin
	n := &Table;
	id := &ID;
	if n = 1 then
		delete from movies where m_id = id;
	elsif n = 2 then
		delete from tv_shows where t_id = id;	
	elsif n = 3 then
		delete from users where u_id = id;
	else
		dbms_output.put_line(chr(10)||'No such table exists.'); 
	end if;
commit;
end;
/
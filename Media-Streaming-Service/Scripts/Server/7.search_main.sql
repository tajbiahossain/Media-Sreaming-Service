set serveroutput on;
set verify off;

declare
			
begin
	
	dbms_output.put_line(chr(10)||'--SELECT TABLE TO SEARCH INTO--');
	dbms_output.put_line(chr(10)||'1. Movies');
	dbms_output.put_line(chr(10)||'2. TV Shows');
	dbms_output.put_line(chr(10)||'3. Users');
end;
/

set serveroutput on;
set verify off;

declare	
	tableNo  number;
	name varchar2(20);
	
begin	
	tableNo:= &table;
	name:= '%&name%';
	if tableNo = 1 then
		server_package.search_movies(name);
	elsif tableNo = 2 then
		server_package.search_tv_shows(name);
	elsif tableNo = 3 then
		server_package.search_users(name);
	else
		dbms_output.put_line(chr(10)||'No such table exists!');
	end if;
end;
/	
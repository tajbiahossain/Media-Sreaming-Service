select * from fav_movies;
select * from fav_tv_shows;

set serveroutput on;
set verify off;

declare	
	
begin
	dbms_output.put_line(chr(10)||'---SELECT TABLE TO DELETE FROM---');
	dbms_output.put_line(chr(10)||'1. Favorite Movies');
	dbms_output.put_line(chr(10)||'2. Favorite TV Shows');
end; 
/

set serveroutput on;
set verify off;

declare	
	id number;
	n number;
	msg varchar2(50);
begin
	n := &Table;
	id := &ID;
	msg:= site_package.site_del_func(n, id);
	dbms_output.put_line(msg);
end;
/
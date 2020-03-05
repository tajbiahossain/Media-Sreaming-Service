select * from watched_movies;
select * from watched_tv_shows;
set serveroutput on;
set verify off;

declare
			
begin
	
	dbms_output.put_line(chr(10)||'--SELECT TABLE TO INSERT INTO--');
	dbms_output.put_line(chr(10)||'1. Favorite Movies');
	dbms_output.put_line(chr(10)||'2. Favorite TV Shows');
end;
/

set serveroutput on;
set verify off;

declare	
	tableNo  number;
	id  number;
	
begin	
	tableNo:= &table;
	id:= &id;
	if tableNo = 1 then
		site_package.insert_fav_movies(id);
	elsif tableNo = 2 then
		site_package.insert_fav_tv_shows(id);
	else
		dbms_output.put_line(chr(10)||'No such table exists!');
	end if;
select * from fav_movies;
select * from fav_tv_shows;
end;
/	
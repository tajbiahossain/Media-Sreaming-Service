set serveroutput on;
set verify off;

declare	
	id number;
	title varchar2(30);
	year number;
	genre varchar2(15);
	dir varchar2(25);
	runtime number;
begin
	id := &ID;
	title := '&Title';
	year := &Year;
	genre := '&Genre';
	dir := '&Director';
	runtime:= &Runtime;
	server_package.insert_update_movies(id, title, year, genre, dir, runtime);
end;
/
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
	season := &No_of_seasons;
	ep := &No_of_episodes;
	server_package.insert_update_tvshows(id, title, year, genre, dir, season, ep);
end;
/
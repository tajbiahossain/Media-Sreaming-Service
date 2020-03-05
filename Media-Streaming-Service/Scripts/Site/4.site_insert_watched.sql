INSERT INTO to_watch_movies (m_id, m_title, m_year, m_genre, m_dir, m_runtime) 
SELECT m_id, m_title, m_year, m_genre, m_dir, m_runtime FROM movies@nowrin_site;

INSERT INTO to_watch_tv_shows (t_id, t_title, t_year, t_genre, t_dir, t_season, t_ep) 
SELECT t_id, t_title, t_year, t_genre, t_dir, t_season, t_ep FROM tv_shows@nowrin_site;

create or replace view movies_view (id, title, year, genre, dir, runtime) as select * from movies@nowrin_site;
select * from movies_view;

create or replace view tv_shows_view (id, title, year, genre, dir, season, ep) as select * from tv_shows@nowrin_site;
select * from tv_shows_view;

set serveroutput on;
set verify off;

declare
			
begin
	
	dbms_output.put_line(chr(10)||'--SELECT TABLE TO INSERT INTO--');
	dbms_output.put_line(chr(10)||'1. Watched Movies');
	dbms_output.put_line(chr(10)||'2. Watched TV Shows');
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
		site_package.insert_watched_movies(id);
	elsif tableNo = 2 then
		site_package.insert_watched_tv_shows(id);
	else
		dbms_output.put_line(chr(10)||'No such table exists!');
	end if;
end;
/

commit;	


select * from watched_movies;
select * from watched_tv_shows;
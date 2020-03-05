drop table log_updel_movies_site;
drop table log_updel_tv_shows_site;

create table log_updel_movies_site (m_sl number, m_log_date date);
create table log_updel_tv_shows_site (t_sl number, t_log_date date);

drop table log_insert_fav_movies;
drop table log_insert_fav_tv_shows;

drop table log_insert_watched_movies;
drop table log_insert_watched_tv_shows;

create table log_insert_fav_movies (m_sl number, m_log_date date);
create table log_insert_fav_tv_shows (t_sl number, t_log_date date);

create table log_insert_watched_movies (m_sl number, m_log_date date);
create table log_insert_watched_tv_shows (t_sl number, t_log_date date);

create or replace trigger movies_updel
after insert
on log_updel_movies_site
for each row

begin
	dbms_output.put_line(chr(10)||'Data altered in Movies table by server');
end;
/

create or replace trigger tv_shows_updel
after insert
on log_updel_tv_shows_site
for each row

begin
	dbms_output.put_line(chr(10)||'Data altered in TV Shows table by server');
end;
/

create or replace trigger fav_movies_inserted
after insert
on fav_movies
for each row

begin
	insert into log_insert_fav_movies values (:new.m_id, sysdate);
	dbms_output.put_line(chr(10)||'Data inserted in table fav_movies.');
end;
/

create or replace trigger watched_movies_inserted
after insert
on watched_movies
for each row

begin
	insert into log_insert_watched_movies values (:new.m_id, sysdate);
	dbms_output.put_line(chr(10)||'Data inserted in table watched_movies.');
end;
/

create or replace trigger watched_tv_shows_inserted
after insert
on watched_tv_shows
for each row

begin
	insert into log_insert_watched_tv_shows values (:new.t_id, sysdate);
	dbms_output.put_line(chr(10)||'Data inserted in table watched_tv_shows.');
end;
/

create or replace trigger fav_tv_shows_inserted
after insert
on fav_tv_shows
for each row

begin
	insert into log_insert_fav_tv_shows values (:new.t_id, sysdate);
	dbms_output.put_line(chr(10)||'Data inserted in table fav_tv_shows.');
end;
/

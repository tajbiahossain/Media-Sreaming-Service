set serveroutput on;

drop table log_insert_movies;
drop table log_insert_tv_shows;
drop table log_insert_users;
drop table log_updel_movies;
drop table log_updel_tv_shows;
drop table log_updel_users;

create table log_insert_movies (m_sl number, m_log_date date);
create table log_insert_tv_shows (t_sl number, t_log_date date);
create table log_insert_users (u_sl number, u_log_date date);
create table log_updel_movies (m_oldname varchar2(20), m_newname varchar2(20) , m_log_date date);
create table log_updel_tv_shows (t_oldname varchar2(20), t_newname varchar2(20) , t_log_date date);
create table log_updel_users (u_oldname varchar2(20), u_newname varchar2(20) , u_log_date date);

create or replace trigger movie_inserted
after insert
on movies
for each row

begin
	insert into log_insert_movies values (:new.m_id, sysdate);
	dbms_output.put_line(chr(10)||'Data inserted in table Movies');
end;
/

create or replace trigger tvshow_inserted
after insert
on tv_shows
for each row

begin
	insert into log_insert_tv_shows values (:new.t_id, sysdate);
	dbms_output.put_line(chr(10)||'Data inserted in table TV Shows');
end;
/

create or replace trigger user_inserted
after insert
on users
for each row

begin
	insert into log_insert_users values (:new.u_id, sysdate);
	dbms_output.put_line(chr(10)||'Data inserted in table Users');
end;
/

create or replace trigger movie_updel
after update or delete
on movies
for each row

begin
	insert into log_updel_movies_site@mauni_site values (:new.m_id, sysdate);
	--insert into log_updel_movies_site@tajbia_site values (:new.m_id, sysdate);
	insert into log_updel_movies values (:old.m_title, :new.m_title, sysdate);
	dbms_output.put_line(chr(10)||'Data updated or deleted in table Movies');
end;
/

create or replace trigger tvshows_updel
after update or delete
on tv_shows
for each row

begin
	insert into log_updel_tv_shows_site@mauni_site values (:new.t_id, sysdate);
	--insert into log_updel_tv_shows_site@tajbia_site values (:new.t_id, sysdate);
	insert into log_updel_tv_shows values (:old.t_title, :new.t_title, sysdate);
	dbms_output.put_line(chr(10)||'Data updated or deleted in table TV Shows');
end;
/

create or replace trigger user_updel
after update or delete
on users
for each row

begin
	insert into log_updel_users values (:old.u_name, :new.u_name, sysdate);
	dbms_output.put_line(chr(10)||'User updated or deleted by server');
end;
/

commit;
/
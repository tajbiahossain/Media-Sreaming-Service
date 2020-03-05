create or replace package body server_package as
	
	procedure insert_update_movies(id in number, title in varchar2, year in number, genre in varchar2, dir in varchar2, runtime in number)
	IS
	
	v_mid movies.m_id%TYPE;
	v_mtitle movies.m_title%TYPE;
	v_myear movies.m_year%TYPE;
	v_mgenre movies.m_genre%TYPE;
	v_mdir movies.m_dir%TYPE;
	v_mruntime movies.m_runtime%TYPE;
	cursor cur is
		select * from movies where m_id = id;
begin
	open cur;
	fetch cur into v_mid, v_mtitle, v_myear, v_mgenre, v_mdir, v_mruntime;
	if cur%notfound then
		insert into movies values (id, title, year, genre, dir, runtime);
	else
		update movies
		set m_title = title, m_year = year, m_genre = genre, m_dir = dir, m_runtime = runtime
		where m_id = id;
	end if;
	close cur;
end insert_update_movies;

	procedure insert_update_tvshows(id in number, title in varchar2, year in number, genre in varchar2, dir in varchar2, season in number, ep in number)
	IS
	
	v_tid tv_shows.t_id%TYPE;
	v_ttitle tv_shows.t_title%TYPE;
	v_tyear tv_shows.t_year%TYPE;
	v_tgenre tv_shows.t_genre%TYPE;
	v_tdir tv_shows.t_dir%TYPE;
	v_tseason tv_shows.t_season%TYPE;
	v_tep tv_shows.t_ep%TYPE;
	cursor cur is
		select * from tv_shows where t_id = id;
begin
	open cur;
	fetch cur into v_tid, v_ttitle, v_tyear, v_tgenre, v_tdir, v_tseason, v_tep;
	
	if cur%notfound then
		insert into tv_shows values (id, title, year, genre, dir, season, ep);
	else
		update tv_shows
		set t_title = title, t_year = year, t_genre = genre, t_dir = dir, t_season = season, t_ep = ep
		where t_id = id;
	end if;
	close cur;
end insert_update_tvshows;

	procedure insert_update_user(id in number, name in varchar2, pass in varchar2, act in varchar2)
	IS
	
	v_uid users.u_id%TYPE;
	v_uname users.u_name%TYPE;
	v_upass users.password%TYPE;
	v_uactive users.active%TYPE;
	cursor cur is
		select * from users where u_id = id;
begin
	open cur;
	fetch cur into v_uid, v_uname, v_upass, v_uactive;
	
	if cur%notfound then
		insert into users values (id, name, pass, act);
	else
		update users
		set u_name = name, password = pass, active = act
		where u_id = id;
	end if;
	close cur;
end insert_update_user;

	procedure search_movies(name in varchar2)
	IS
	
	v_mid movies.m_id%TYPE;
	v_mtitle movies.m_title%TYPE;
	v_myear movies.m_year%TYPE;
	v_mgenre movies.m_genre%TYPE;
	v_mdir movies.m_dir%TYPE;
	v_mruntime movies.m_runtime%TYPE;
	cursor cur is
		select * from movies where m_title like name;
begin
	open cur;
	fetch cur into v_mid, v_mtitle, v_myear, v_mgenre, v_mdir, v_mruntime;
	
	if cur%notfound then
		dbms_output.put_line(chr(10)||'Movie does not exist!');
	else		
		dbms_output.put_line(chr(10)||v_mid || '  ' || v_mtitle || '  ' || v_myear || '  ' ||v_mgenre ||'  ' || v_mdir||'  '||v_mruntime);
	end if;
	close cur;
end search_movies;

	procedure search_tv_shows(name in varchar2)
	IS
	
	v_tid tv_shows.t_id%TYPE;
	v_ttitle tv_shows.t_title%TYPE;
	v_tyear tv_shows.t_year%TYPE;
	v_tgenre tv_shows.t_genre%TYPE;
	v_tdir tv_shows.t_dir%TYPE;
	v_tseason tv_shows.t_season%TYPE;
	v_tep tv_shows.t_ep%TYPE;

	cursor cur is
		select * from tv_shows where t_title like name;
begin

	open cur;
	fetch cur into v_tid, v_ttitle, v_tyear, v_tgenre, v_tdir, v_tseason, v_tep;
	
	if cur%notfound then
		 dbms_output.put_line(chr(10)||'TV show does not exist!');
	else
		
		dbms_output.put_line(chr(10)||v_tid || '  ' || v_ttitle || '  ' || v_tyear || '  ' ||v_tgenre ||'  ' || v_tdir||'  '|| v_tseason || '  ' || v_tep);
	end if;
	close cur;
end search_tv_shows;
end server_package;
/
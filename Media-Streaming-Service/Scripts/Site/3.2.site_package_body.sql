create or replace package body site_package as 
procedure insert_watched_movies(id in number)
	IS
	
	v_mid to_watch_movies.m_id%TYPE;
	v_mtitle to_watch_movies.m_title%TYPE;
	v_myear to_watch_movies.m_year%TYPE;
	v_mgenre to_watch_movies.m_genre%TYPE;
	v_mdir to_watch_movies.m_dir%TYPE;
	v_mruntime to_watch_movies.m_runtime%TYPE;
	cursor cur is
		select * from to_watch_movies where m_id = id;
begin
	open cur;
	fetch cur into v_mid, v_mtitle, v_myear, v_mgenre, v_mdir, v_mruntime;
	
	if cur%notfound then
		dbms_output.put_line(chr(10)||'Movie does not exist!');
	else		
		insert into watched_movies values (v_mid, v_mtitle, v_myear, v_mgenre, v_mdir, v_mruntime);
		delete from to_watch_movies where m_id = id;
		
	end if;
	close cur;
end insert_watched_movies;

procedure insert_watched_tv_shows(id in number)
	IS
	
	v_tid to_watch_tv_shows.t_id%TYPE;
	v_ttitle to_watch_tv_shows.t_title%TYPE;
	v_tyear to_watch_tv_shows.t_year%TYPE;
	v_tgenre to_watch_tv_shows.t_genre%TYPE;
	v_tdir to_watch_tv_shows.t_dir%TYPE;
	v_tseason to_watch_tv_shows.t_season%TYPE;
	v_tep to_watch_tv_shows.t_ep%TYPE;

	cursor cur is
		select * from to_watch_tv_shows where t_id = id;
begin

	open cur;
	fetch cur into v_tid, v_ttitle, v_tyear, v_tgenre, v_tdir, v_tseason, v_tep;
	
	if cur%notfound then
		 dbms_output.put_line(chr(10)||'TV show does not exist!');
	else
		
		insert into watched_tv_shows values (v_tid, v_ttitle, v_tyear, v_tgenre, v_tdir, v_tseason, v_tep);
		delete from to_watch_tv_shows where t_id = id;
	end if;
	close cur;
end insert_watched_tv_shows;

procedure insert_fav_movies(id in number)
	IS
	
	v_mid watched_movies.m_id%TYPE;
	v_mtitle watched_movies.m_title%TYPE;
	v_myear watched_movies.m_year%TYPE;
	v_mgenre watched_movies.m_genre%TYPE;
	v_mdir watched_movies.m_dir%TYPE;
	v_mruntime watched_movies.m_runtime%TYPE;
	cursor cur is
		select * from watched_movies where m_id = id;
begin
	open cur;
	fetch cur into v_mid, v_mtitle, v_myear, v_mgenre, v_mdir, v_mruntime;
	
	if cur%notfound then
		dbms_output.put_line(chr(10)||'Movie does not exist!');
	else		
		insert into fav_movies values (v_mid, v_mtitle, v_myear, v_mgenre, v_mdir, v_mruntime);
		
	end if;
	close cur;
end insert_fav_movies;

procedure insert_fav_tv_shows(id in number)
	IS
	
	v_tid watched_tv_shows.t_id%TYPE;
	v_ttitle watched_tv_shows.t_title%TYPE;
	v_tyear watched_tv_shows.t_year%TYPE;
	v_tgenre watched_tv_shows.t_genre%TYPE;
	v_tdir watched_tv_shows.t_dir%TYPE;
	v_tseason watched_tv_shows.t_season%TYPE;
	v_tep watched_tv_shows.t_ep%TYPE;

	cursor cur is
		select * from watched_tv_shows where t_id = id;
begin

	open cur;
	fetch cur into v_tid, v_ttitle, v_tyear, v_tgenre, v_tdir, v_tseason, v_tep;
	
	if cur%notfound then
		 dbms_output.put_line(chr(10)||'TV show does not exist!');
	else
		
		insert into fav_tv_shows values (v_tid, v_ttitle, v_tyear, v_tgenre, v_tdir, v_tseason, v_tep);
	end if;
	close cur;
end insert_fav_tv_shows;

function site_del_func(tablenum in number, idnum in number)
	return varchar2
	is

output_msg varchar2(50);
begin

	if tablenum = 1 then
		delete from fav_movies where m_id = idnum;
		output_msg := 'Movie ID ' || idnum || ' deleted from fav_movies.';
	elsif tablenum = 2 then
		delete from fav_tv_shows where t_id = idnum;
		output_msg := 'Movie ID ' || idnum || ' deleted from fav_tv_shows.';
	else
		output_msg := 'No such table or id exists.';
	end if;

return output_msg;

end site_del_func;

function site_search_movies_func(name in varchar2)
	return varchar2
	IS
	output_msg varchar2(1000);

	v_mid number;
	v_mtitle varchar2(15);
	v_myear number;
	v_mgenre varchar2(15);
	v_mdir varchar2(20);
	v_mruntime number;
	cursor cur is
		select * from movies@nowrin_site where m_title like name;
begin
	
	open cur;
	fetch cur into v_mid, v_mtitle, v_myear, v_mgenre, v_mdir, v_mruntime;
	
	if cur%notfound then
		output_msg:= 'Not Found';
	else		
		output_msg:= 'Found: ' ||v_mid || '  ' || v_mtitle || '  ' || v_myear || '  ' ||v_mgenre ||'  ' || v_mdir||'  '||v_mruntime;
	end if;
	close cur;
	return output_msg;
end site_search_movies_func;

function site_search_tv_shows_func(name in varchar2)
	return varchar2
	IS
	output_msg varchar2(1000);

	v_tid number;
	v_ttitle varchar2(15);
	v_tyear number;
	v_tgenre varchar2(15);
	v_tdir varchar2(20);
	v_tseason number;
	v_tep number;

	cursor cur is
		select * from tv_shows@nowrin_site where t_title like name;
begin

	open cur;
	fetch cur into v_tid, v_ttitle, v_tyear, v_tgenre, v_tdir, v_tseason, v_tep;
	
	if cur%notfound then
		 output_msg:= 'Not Found';
	else
		output_msg:= 'Found: ' ||v_tid || '  ' || v_ttitle || '  ' || v_tyear || '  ' ||v_tgenre ||'  ' || v_tdir||'  '|| v_tseason || '  ' || v_tep;
	end if;
	close cur;

return output_msg;
end site_search_tv_shows_func;

end site_package;
/
create or replace package site_package as
	
	procedure insert_watched_movies(id in number);
	procedure insert_watched_tv_shows(id in number);
	procedure insert_fav_movies(id in number);
	procedure insert_fav_tv_shows(id in number);
	function site_del_func(tablenum in number, idnum in number)
		return varchar2;
	function site_search_movies_func(name in varchar2)
		return varchar2;
	function site_search_tv_shows_func(name in varchar2)
		return varchar2;
	
end site_package;
/
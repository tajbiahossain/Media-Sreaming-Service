create or replace package server_package as
	
	procedure insert_update_movies(id in number, title in varchar2, year in number, genre in varchar2, dir in varchar2, runtime in number);
	procedure insert_update_tvshows(id in number, title in varchar2, year in number, genre in varchar2, dir in varchar2, season in number, ep in number);
	procedure insert_update_user(id in number, name in varchar2, pass in varchar2, act in varchar2);
	procedure search_movies(name in varchar2);
	search_tv_shows(name in varchar2);
	
end server_package;
/
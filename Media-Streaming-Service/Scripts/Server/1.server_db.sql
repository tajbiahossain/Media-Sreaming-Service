clear screen;

DROP TABLE movies cascade constraints;
DROP TABLE tv_shows cascade constraints;
DROP TABLE users cascade constraints;

CREATE TABLE movies (
	m_id number, 
	m_title varchar2(15), 
	m_year number, 
	m_genre varchar2(15), 
	m_dir varchar2(20),
	m_runtime number,
        PRIMARY KEY(m_id)); 

CREATE TABLE tv_shows (
	t_id number,
	t_title varchar2(15),
	t_year number, 
	t_genre varchar2(15), 
	t_dir varchar2(20),
	t_season number,
	t_ep number,
        PRIMARY KEY(t_id)); 

CREATE TABLE users (
	u_id number,
	u_name varchar2(10),
	password varchar2(10),        
	active varchar2(6),
	PRIMARY KEY(u_id));	

insert into movies values (1, 'Inception', 2010, 'Sci-fi/Thriller', 'Christopher Nolan', 148); 
insert into movies values (2, 'The Matrix', 1999, 'Fantasy/Sci-fi', 'The Wachowskis', 136); 
insert into movies values (3, 'The Lion King', 1994, 'Drama/Music', 'Roger Allers', 88); 
insert into movies values (4, 'Aladdin', 2019, 'Fantasy/Romance', 'Guy Ritchie', 129);

insert into tv_shows values (1, 'Chernobyl', 2019, 'Drama', 'Johan Renck', 1, 5); 
insert into tv_shows values (2, 'Breaking Bad', 2008, 'Crime drama', 'Michelle MacLaren', 5, 62); 
insert into tv_shows values (3, 'Sherlock', 2010, 'Drama', 'Mark Gatiss', 4, 13); 
insert into tv_shows values (4, 'Euphoria', 2019, 'Drama', 'Jennifer Morrison', 1, 8); 

insert into users values (1, 'Tajbia', 'abc', 'No');
insert into users values (2, 'Mauni', 'def', 'No');
insert into users values (3, 'Nowrin', 'rty', 'No');

commit;

create or replace view Movie as
select *
from movies;
select * from Movie;

create or replace view TV_Show as
select *
from tv_shows;
select * from TV_Show;

create or replace view User_ as
select *
from users;
select * from User_;
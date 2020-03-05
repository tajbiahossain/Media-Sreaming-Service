clear screen;

create or replace view users_view (user_id, user_name, password, active) as select * from users@nowrin_site;
select * from users_view;
Accept input_string char format 'A20' prompt 'Enter username: ';
Accept input_string2 char format 'A20' prompt 'Enter password: ';

set verify off;
set serveroutput on;
declare
 	u_input varchar2(20):= '&input_string';
	p_input varchar2(20):= '&input_string2';
	uname varchar2(10);
	upass varchar2(10);
	uid number;
	uactive varchar2(6);
	msg1 varchar2(4000);
	msg2 varchar2(4000);
	msg3 varchar2(4000);
	msg4 varchar2(4000);
	msg5 varchar2(4000);
	msg6 varchar2(4000);
	cursor curs(name varchar2) is
		select u_id from users@nowrin_site where u_name = name;
	
begin
	open curs(u_input);
		fetch curs into uid;
		if curs%notfound then 
			dbms_output.put_line('User not found. Create new account:');
		select max(u_id) into uid from users@nowrin_site;
		uid := uid+1;
		insert into users@nowrin_site values (uid, u_input, p_input, 'No');
		dbms_output.put_line('Account created');
		else
			select password into upass from users@nowrin_site
			where u_name = u_input;
			if upass = p_input then
				update users@nowrin_site
				set active='Yes'
				where u_name = u_input;
				msg1 := 'create table fav_movies (
					m_id number, 
					m_title varchar2(15), 
					m_year number, 
					m_genre varchar2(15), 
					m_dir varchar2(20),
					m_runtime number,
        					PRIMARY KEY(m_id))';
				execute immediate msg1;
				msg2 := 'create table to_watch_movies (
					m_id number, 
					m_title varchar2(15), 
					m_year number, 
					m_genre varchar2(15), 
					m_dir varchar2(20),
					m_runtime number,
        					PRIMARY KEY(m_id))';
				execute immediate msg2;
				msg3 := 'create table watched_movies (
					m_id number, 
					m_title varchar2(15), 
					m_year number, 
					m_genre varchar2(15), 
					m_dir varchar2(20),
					m_runtime number,
        					PRIMARY KEY(m_id))';
				execute immediate msg3;
				msg4 := 'CREATE TABLE fav_tv_shows (
					t_id number,
					t_title varchar2(15),
					t_year number, 
					t_genre varchar2(15), 
					t_dir varchar2(20),
					t_season number,
					t_ep number,
        					PRIMARY KEY(t_id))';
				execute immediate msg4;
				msg5 := 'CREATE TABLE to_watch_tv_shows (
					t_id number,
					t_title varchar2(15),
					t_year number, 
					t_genre varchar2(15), 
					t_dir varchar2(20),
					t_season number,
					t_ep number,
        					PRIMARY KEY(t_id))';
				execute immediate msg5;
				msg6 := 'CREATE TABLE watched_tv_shows (
					t_id number,
					t_title varchar2(15),
					t_year number, 
					t_genre varchar2(15), 
					t_dir varchar2(20),
					t_season number,
					t_ep number,
        					PRIMARY KEY(t_id))';
				execute immediate msg6;
				dbms_output.put_line('Tables created.');
			else 
				dbms_output.put_line('Wrong password.');
			end if;
		end if;
	close curs;

EXCEPTION 
	WHEN no_data_found THEN
		dbms_output.put_line('User not found.');

commit;	
end;
/
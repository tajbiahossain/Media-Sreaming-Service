declare	
	id number;
	name varchar(20);
	pass varchar(20);
	active varchar(6);	
begin
	id := &User_id;
	name := '&Username';
	pass := '&Password';
	active := '&Active(yes or no)';
	server_package.insert_update_user(id, name, pass, active);
end;
/
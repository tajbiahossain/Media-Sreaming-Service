once the codes are run in the sequence given, the following should happen-

(0)server_db
(1)site_triggers
(2)site_login(fixed) ** haven't made any changes besides views 
	-user should log in
	-user activation status changed to yes
	-to_watch, unwatched, and fav tables should be created

****** from here on out (including trigger too), i used tables movies and tv shows directly from db. 
(3)site_insert_proc
(4)site_insert_watch 
	-all movies/tv shows are automatically copied to unwatched
	-unwatched tables displayed
	-upon input, watched movies/tv shows are added to watched table and removed from unwatched

(5)site_insert_fav
	-watched tables displayed
	-upon input, fav movies/tv shows are added to fav table 

(6)site_func
(7)site_del
	-deletes tuples by id from favorite movies
	-deletes tuples by id from favorite tv_shows

(8)site_search
	-searches unwatched movies by id
	-searches unwatched tv shows by id

Remaining work:

	-exceptions (one system defined - should have a user defined one too)
	-trigger log : user updated or added to from site- otherwise no changes made to original server tables
	- *****(and if possible, return/print multiple rows and etc using loop)
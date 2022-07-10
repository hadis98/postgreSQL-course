create index on users(username);
drop index users_username_idx;

select relname,relkind
from pg_class
where relkind ='i';

select pg_size_pretty(pg_relation_size('users_username_idx'));

create extension pageinspect;
select * from bt_metap('users_username_idx');
select * from bt_page_items('users_username_idx',3);
select * from bt_page_items('users_username_idx',1);

select ctid,* 
from users
where username ='Aaliyah78';

select oid,datname
from pg_database;
show data_directory;

select *
from pg_class
where relkind ='i';
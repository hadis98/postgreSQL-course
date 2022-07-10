create schema test;
create table test.users(id serial primary key, username varchar);
insert into test.users (username)
values('p1'),
('p2');
select *
from test.users;
show search_path;
SET search_path TO test,public;
select * from users;

SET search_path TO "$user",public;
create table account(
    id serial primary key,
    name varchar(30) not null,
    balance integer not null check(balance > 0)
)
insert into account (name, balance)
values ('person1', 100),
    ('person2', 100);

select *
from account;

BEGIN;

update account
set balance = balance - 50
where name = 'person1';

update account
set balance = balance + 50
where name = 'person2';
commit;


begin;
-- select * from sdfasdf;
-- select * from account;
rollback;
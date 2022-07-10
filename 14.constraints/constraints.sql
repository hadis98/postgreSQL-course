create table products(
    id serial primary key,
    name varchar(40),
    department varchar(40),
    price integer,
    weight integer
)
insert into products(name, department, price, weight)
values ('Shirt', 'Clothes', 20, 1);
-- price ='null'
insert into products(name, department, weight)
values ('Pants', 'Clothes', 4);
alter table products
alter column price
set not null;
update products
set price = 9999
where price is null;
-- default values:
create table products(
    id serial primary key,
    name varchar(40) NOT NULL,
    department varchar(40) NOT NULL,
    price integer DEFAULT 999,
    weight integer
)
ALTER TABLE products
ALTER COLUMN price
SET DEFAULT 999;

insert into products (name,department,weight)
values ('Gloves','Tools',1);
select * from products;


-- unique

insert into products (name,department,price,weight)
values ('Shirt','Tools',24,1);
alter table products
add unique (name);

-- delete a  constraint
alter table products
drop constraint products_name_key;

alter table products
add unique (name,department);

insert into products (name,department,price,weight)
values ('Shirt','Housewares',24,1);
select * from products;

-- check constraint
insert into products (name,department,price,weight)
values ('Belt','Clothes',-99,1);
alter table products
add check (price>0);

CREATE TABLE orders(
    id serial primary key,
    name VARCHAR(40) not null,
    created_at TIMESTAMP not null,
    est_delivery TIMESTAMP not null,
    check(created_at < est_delivery)
);

insert into orders(name,created_at,est_delivery)
values('Shirt','2001-NOV-20 01:00AM'::timestamp,'2001-NOV-26 02::00PM')
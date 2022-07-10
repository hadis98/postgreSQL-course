create table cities(
    name varchar(50),
    country varchar(50),
    population integer,
    area integer
);

insert into cities (name,country,population,area) 
values('Tokyo','Japan',38505000,8223);

insert into cities 
values
('Delhi','India',28125000,2240),
('Shanghai','China',22125000,4015),
('Sao Paulo','Brazil',20935000,3043);

insert into cities (name,country,population,area)
values
('Delhi','India',28125000,2240),
('Shanghai','China',22125000,4015),
('Sao Paulo','Brazil',20935000,3043);

select * from cities;

select name,country from cities;
select name,name,name from cities;
select name,population / area as population_density from cities;
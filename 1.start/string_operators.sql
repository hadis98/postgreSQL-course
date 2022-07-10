select name ||', ' || country as combination from cities;
select concat(name,', ',country) as combination from cities;
select
  concat(UPPER(name), ' ', UPPER(country)) as combination
from
  cities;

select
  UPPER(concat(name, ' ', country)) as combination
from
  cities;  
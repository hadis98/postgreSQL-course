SELECT
  name,
  area
FROM
  cities
WHERE
  area > 4000;


SELECT
  name,
  area
FROM
  cities
WHERE
  area = 8223;

SELECT
  name,
  area
FROM
  cities
WHERE
  area <> 8223;


SELECT
  name,
  area
FROM
  cities
WHERE
  area BETWEEN 2000
  AND 4000;

SELECT
  name,
  area
FROM
  cities
WHERE
  name in ('Delhi', 'Shanghai');


SELECT
  name,
  area
FROM
  cities
WHERE
  name NOT in ('Delhi', 'Shanghai');


SELECT
  name,
  area
FROM
  cities
WHERE
  area NOT in (8223, 3043);

SELECT
  name,
  area
FROM
  cities
WHERE
  area NOT in (8223, 3043) AND name ='Delhi';

SELECT
  name,
  area
FROM
  cities
WHERE
  area NOT in (8223, 3043) 
  OR name ='Delhi'
  OR name='Tokyo';

SELECT name,manufacturer FROM phones 
WHERE manufacrurer IN ('Apple','Samsung');

SELECT name,manufacturer FROM phones 
WHERE manufacrurer ='Apple' OR manufacrurer ='Samsung';

SELECT name, population/area as population_density
FROM cities
WHERE population/area > 6000;

SELECT name,price * units_sold as total_revenue
FROM phones
WHERE price * units_sold > 1000000;
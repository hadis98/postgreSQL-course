SELECT *
FROM users
OFFSET 40;

-- skip first 40 users and only show us the last 10

-- take sum specific number of result set

SELECT *
FROM users
OFFSET 40 LIMIT 2;

SELECT *
FROM users
LIMIT 5;

SELECT *
FROM users
OFFSET 30
LIMIT 5;

-- 5 least expensive products
SELECT *
FROM products
ORDER BY price
LIMIT 5;

-- 5 most expensive products exept most expensive one
SELECT *
FROM products
ORDER BY price DESC
LIMIT 5
OFFSET 1;


-- show users 20 products per pages on webiste
SELECT *
FROM products
ORDER BY price 
LIMIT 20
OFFSET 0;

SELECT *
FROM products
ORDER BY price 
LIMIT 20
OFFSET 20;

SELECT *
FROM products
ORDER BY price 
LIMIT 20
OFFSET 40;
-- so on....................


SELECT *
FROM products
ORDER BY id
LIMIT 20
OFFSET 1


-- only show the second and third most expensive phones
SELECT NAME
FROM phones
ORDER BY price DESC
LIMIT 2
OFFSET 1;
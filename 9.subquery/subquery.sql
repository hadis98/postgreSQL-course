SELECT name,price
FROM products
WHERE price > (
  SELECT MAX(price)
  FROM products
  WHERE department ='Toys'
);

SELECT MAX(price)
FROM products;


SELECT name,price,
(SELECT Max(price) FROM products)
 FROM products
 WHERE price>867;

SELECT name,price,
(SELECT price FROM products WHERE id=3)
AS id_3_price
 FROM products
 WHERE price>867;


-- print name,price for each phone
-- plus
-- print ration of phones price against max price of all phones
SELECT name,price,
price / (SELECT MAX(price) FROM phones) AS price_ratio
FROM phones;


-- FROM

SELECT name,price_weight_ration
FROM 
(SELECT name,price/weight as price_weight_ration
FROM products
) as P
WHERE price_weight_ration>5;


SELECT *
FROM (SELECT MAX(price) FROM products) AS P;

-- we use 'from' subquery
-- when we want to use aggregate functions on another aggregate function
-- calculate average number of orders for all users
SELECT order_count
FROM(
SELECT COUNT(*) AS order_count
FROM orders
GROUP BY user_id)AS p

SELECT AVG(order_count)
FROM(
SELECT COUNT(*) AS order_count
FROM orders
GROUP BY user_id)AS p


-- calculate avg price of sold phones for each manufacturer
-- then print highest avg price
SELECT MAX(avg_price)
FROM 
(SELECT SUM(price * units_slod)/ COUNT(*) AS avg_price
FROM phones
GROUP BY manufacturer)AS P

-- calculate avg price of phones(not soled one) for each manufacturer
-- then print highest avg price
SELECT MAX(avg_price) AS max_avg_price
FROM 
(
    SELECT AVG(price) AS avg_price
    FROM phones
    GROUP BY manufacturer
)AS P

-- name of people who ordered a product with id=3
SELECT first_name
FROM users
JOIN (
  SELECT user_id 
  FROM orders
  WHERE product_id =3
) AS o 
 ON o.user_id = users.id;
-- ==== (equal to below solution)
SELECT first_name
FROM users
JOIN orders AS o  
ON o.user_id = users.id
WHERE o.product_id =3;


-- subquerys in  where part
SELECT id FROM products
WHERE price/weight >200;

SELECT id 
FROM orders
WHERE product_id in (
  SELECT id FROM products
	WHERE price/weight >200
);
-- ===== (equal solution with join)
SELECT o.id 
FROM orders AS o 
JOIN products AS p on o.product_id = p.id
WHERE price/weight >200;

-- show name of all products with a price greater than average product price

SELECT AVG(price)
FROM products;
-- so
SELECT name ,price
FROM products 
WHERE price > (
  SELECT AVG(price)
	FROM products
);

-- print name,price of phones that have a price greater than samsung S5620 Monte
SELECT name,price
FROM phones
WHERE price > (
  SELECT price
  FROM phones 
  WHERE name ='S5620 Monte'
);

-- show name of all products that are not in the same department as products with a price less than 100

SELECT name ,department
FROM products
WHERE department not in (
  SELECT department
  FROM products
  WHERE price < 100
 );


-- show name,department,price of products that are more expensive than all products in 'Industrial' department
SELECT price 
FROM products
WHERE department ='Industrial';

SELECT name ,department,price
FROM products
WHERE price > ALL(
  SELECT price 
  FROM products
  WHERE department ='Industrial'
 );


SELECT name ,department,price
FROM products
WHERE price >(
  SELECT MAX(price)
  FROM products
  WHERE department ='Industrial'
);

-- show name,department,price of products that are more expensive than at least one product in 'Industrial' department
SELECT name ,department,price
FROM products
WHERE price > SOME(
  SELECT price
  FROM products
  WHERE department ='Industrial'
 );


-- print name of all phones that have a price greater than any phone made by Samsung

SELECT NAME
FROM phones
WHERE price > ALL (
  SELECT price 
  FROM phones
  WHERE manufacturer ='Samsung'
);


-- show name,department,price of the most expensive product in each department
-- my solution:
SELECT name,department,price
FROM products AS p1
WHERE price in (
  SELECT Max(price)
  FROM products AS p2
  GROUP BY department
);

-- correlated subqueries
SELECT name,department,price
FROM products AS p1
WHERE price = ( --a single value that is going to come out of a subquery
  SELECT Max(price)
  FROM products AS p2
  WHERE p1.department = p2.department
);

-- print number of orders for every product
-- without using a join or group by
SELECT name ,(
  SELECT COUNT(*)
  FROM orders AS o1
  WHERE o1.product_id = p1.id
  )AS num_orders
FROM products as p1


SELECT (SELECT MAX(price) FROM products); 
SELECT
(SELECT MAX(price) FROM products) 
 /
(SELECT AVG(price) FROM products) AS max_avg;



SELECT
(SELECT MAX(price) FROM products) ,
(SELECT AVG(price) FROM products) ;



SELECT
(SELECT MAX(price) FROM products)AS max_price,
(SELECT MIN(price)FROM products) AS min_price,
(SELECT AVG(price)FROM products) AS avg_price;
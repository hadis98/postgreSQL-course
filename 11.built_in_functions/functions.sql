SELECT GREATEST(30,16,54);

SELECT name,weight,GREATEST(30,2*weight)
FROM products;

SELECT LEAST(4,2,6,9);

SELECT name,price,LEAST(price * 0.5,400)
FROM products;

SELECT name,price,
CASE
	WHEN price>600 THEN 'high'
  WHEN price > 300 THEN 'medium'
  ELSE 'cheap'
END
FROM products;

-- if we remove else =>> it will put 'null' instead
SELECT name,price,
CASE
	WHEN price>600 THEN 'high'
  WHEN price > 300 THEN 'medium'
END
FROM products;
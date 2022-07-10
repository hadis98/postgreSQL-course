SELECT * FROM products 
ORDER BY price;

SELECT * FROM products 
ORDER BY price ASC;


SELECT * FROM products 
ORDER BY price DESC;

SELECT * FROM products 
ORDER BY name;

SELECT * FROM products 
ORDER BY name DESC;

-- if we have same prices for 2 products
-- order them by their weight
SELECT * FROM products 
ORDER BY price ,weight;

-- ascending price and descending weight 
SELECT * FROM products 
ORDER BY price ,weight DESC;

SELECT * FROM products 
ORDER BY price DESC ,weight DESC;
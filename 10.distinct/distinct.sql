SELECT DISTINCT department FROM products;

SELECT COUNT(DISTINCT department) FROM products;

-- list of all the unique combinations of department,name 
-- every single row will be unique
SELECT DISTINCT department,name 
FROM products;


SELECT  COUNT(DISTINCT manufacturer)
FROM phones;
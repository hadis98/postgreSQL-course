SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM users;

-- number of paid and unpaid orders
SELECT paid,COUNT(*)
FROM orders
GROUP BY paid;

SELECT first_name,last_name, paid
FROM orders AS o  JOIN users AS u
ON o.user_id = u.id;
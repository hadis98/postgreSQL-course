SELECT * 
FROM products
ORDER BY price DESC
LIMIT 4;


SELECT *
FROM products 
ORDER BY price / weight DESC
LIMIT 4;

-- to find 4 proudcts with highest price
-- and
-- 4 products with highest price/weight ratio
-- we use union: (union will remove duplicate items)
(
  SELECT
    *
  FROM
    products
  ORDER BY
    price DESC
  LIMIT
    4
)
UNION
  (
    SELECT
      *
    FROM
      products
    ORDER BY
      price / weight DESC
    LIMIT
      4
  );

-- to show duplicate items as well we use 'union all'
(
  SELECT
    *
  FROM
    products
  ORDER BY
    price DESC
  LIMIT
    4
)
UNION ALL
(
    SELECT
      *
    FROM
      products
    ORDER BY
      price / weight DESC
    LIMIT
      4
);


-- to see the common item in 2above sets:
-- use 'intersect'
(
  SELECT
    *
  FROM
    products
  ORDER BY
    price DESC
  LIMIT
    4
)
INTERSECT
(
    SELECT
      *
    FROM
      products
    ORDER BY
      price / weight DESC
    LIMIT
      4
)

-- we get error!!
SELECT name FROM products
UNION 
SELECT price FROM products;
-- UNION types character varying and integer cannot be matched


-- INTERSECT ALL:
-- if we have multiple items that are identical in set1 or set2
-- show us all
(
  SELECT
    *
  FROM
    products
  ORDER BY
    price DESC
  LIMIT
    4
)
INTERSECT ALL
  (
    SELECT
      *
    FROM
      products
    ORDER BY
      price / weight DESC
    LIMIT
      4
  )


-- all rows that are in first query but not in the second query
-- we dont see intersect (common items) in this result
(
  SELECT *
  FROM products
  ORDER BY price DESC
  LIMIT 4
)
EXCEPT
(
    SELECT *
    FROM products
    ORDER BY price / weight DESC
    LIMIT 4
)

-- write a query that will print manufacturer of phones where the phone's price is less than 170
-- also
-- print all manufacturer that have created more than two phones
(SELECT manufacturer 
FROM phones
WHERE price < 170)
UNION 
(SELECT manufacturer 
FROM phones
GROUP BY manufacturer
HAVING COUNT(*) > 2);
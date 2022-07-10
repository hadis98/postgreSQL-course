SELECT user_id
FROM COMMENTS 
GROUP BY user_id;

SELECT MIN(id) FROM COMMENTS;
SELECT MAX(id) FROM COMMENTS;
SELECT AVG(id) FROM COMMENTS;
SELECT COUNT(id) FROM COMMENTS;
SELECT SUM(id) FROM COMMENTS;

-- Error!!!
-- column "comments.id" must appear in the GROUP BY clause or be used in an aggregate function
SELECT MIN(id), id FROM COMMENTS;


-- number of comments of each user
SELECT user_id,COUNT(id) as num_comments_created
FROM COMMENTS 
GROUP BY user_id;



SELECT user_id,MAX(id)
FROM COMMENTS
GROUP BY user_id;

-- when we have null value for id:
SELECT COUNT(id) from photos; --20
SELECT COUNT(*) from photos; --21 (including null value)

SELECT user_id,COUNT(*) as num_comments_created
FROM COMMENTS 
GROUP BY user_id;


-- number of comments on each photo
SELECT photo_id , COUNT(*)
FROM COMMENTS 
GROUP BY photo_id;


SELECT author_id,COUNT(*)
FROM books
GROUP BY author_id;

SELECT name,COUNT(*)
FROM books
JOIN authors on authors.id = books.author_id
GROUP BY authors.name;


-- number of comments per photo for photo_id<3 and
-- number of comments should be more than 2
SELECT photo_id ,COUNT(*)
FROM COMMENTS 
WHERE photo_id <3
GROUP BY photo_id
HAVING COUNT(*) >2;


SELECT
  user_id
FROM
  COMMENTS
WHERE
  photo_id BETWEEN 1and 50
GROUP BY
  user_id
HAVING
  COUNT(*) >= 20;


SELECT user_id,COUNT(*)
FROM COMMENTS
WHERE photo_id <= 50
GROUP BY user_id
HAVING COUNT(*) >= 20;


SELECT manufacturer,SUM(price * units_sold)
FROM phones
GROUP BY manufacturer
HAVING SUM(price * units_sold) > 2000000;

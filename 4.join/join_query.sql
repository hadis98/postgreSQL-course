SELECT contents,username,photo_id
FROM
  COMMENTS
  JOIN users ON COMMENTS.user_id = users.id;


SELECT contents,url
FROM COMMENTS JOIN photos
on COMMENTS.photo_id = photos.id;  

SELECT photos.id as photo_id ,COMMENTS.id as comment_id
FROM photos
JOIN COMMENTS on photos.id = COMMENTS.photo_id;

SELECT
  p.id as photo_id,
  c.id as comment_id
FROM
  photos AS p
  JOIN COMMENTS as c on p.id = c.photo_id;


SELECT url,username
FROM photos
JOIN users on users.id = photos.user_id;

-- we add a photo with user_id =NULL
INSERT INTO photos (url,user_id)
VALUES ('http://banner.jpg',NULL);  

SELECT url,username
FROM photos
JOIN users on users.id = photos.user_id;

-- we want to see every photo no matter if it does not have any user_id 
SELECT url,username
FROM photos
LEFT JOIN users on users.id = photos.user_id;



INSERT INTO users (username) VALUES  ('Nicole');
-- we see Nicole (a user) that does not have a photo
SELECT url,username
FROM photos
RIGHT JOIN users on users.id = photos.user_id;


-- FULL JOIN (FULL OUTTER JOIN) all the possibilites
SELECT url,username
FROM photos
FULL  JOIN users on users.id = photos.user_id;


-- find url,contents of a photo that was  posted and  written by same user
SELECT url,contents 
FROM photos AS p JOIN COMMENTS AS c on p.id =  c.photo_id 
WHERE p.user_id = c.user_id;

-- get username of persons who posted their own photo
SELECT url,contents ,users.username
FROM photos AS p JOIN COMMENTS AS c on p.id =  c.photo_id
JOIN users on users.id = c.user_id
WHERE p.user_id = c.user_id;

-- better way:
SELECT
  url,
  contents,
  users.username
FROM
  photos AS p
  JOIN comments AS c on p.id = c.photo_id
  JOIN users on users.id = c.user_id
  AND users.id = p.user_id;


-- we are using inner join =>
-- if we have null values => they will be removed
SELECT
  title,
  name,
  rating
FROM
  reviews AS r
  JOIN books AS b on r.book_id = b.id
  JOIN authors AS a ON a.id = b.author_id
  AND r.reviewer_id = a.id;
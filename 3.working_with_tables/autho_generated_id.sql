CREATE TABLE users(
  id serial PRIMARY KEY,
  username VARCHAR(50)
);

INSERT INTO users(username)
VALUES 
('monhan93'),
('pferrer'),
('si93onis'),
('99stroman')


SELECT * FROM users;

CREATE TABLE photos(
  id serial PRIMARY KEY,
  url VARCHAR(200),
  user_id INTEGER REFERENCES users(id)
);

INSERT INTO
  photos (url, user_id)
VALUES
  ('http://one.jpg', 4);

SELECT * FROM photos;


INSERT INTO
  photos (url, user_id)
VALUES
  ('http://two.jpg', 1),
  ('http://23.jpg', 1),
  ('http://45.jpg', 1),
  ('http://12.jpg', 2),
  ('http://8.jpg', 3),
  ('http://14.jpg', 4);

SELECT * FROM photos
WHERE user_id =4;


SELECT * FROM photos
JOIN users ON users.id = photos.user_id;

-- foreign key constraints:
INSERT INTO photos (url,user_id)
VALUES('http://33',9999);
-- we dont have a user_id =9999 on our database =>> it returns error

INSERT INTO photos (url,user_id)
VALUES('http://33',NULL);
-- when a photo is not related to any user
-- we put NULL in user_id

DROP TABLE photos;



-- ON DELETE CASCADE
CREATE TABLE photos(
  id serial PRIMARY KEY,
  url VARCHAR(200),
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE
);

INSERT INTO
  photos (url, user_id)
VALUES
  ('http://two.jpg', 1),
  ('http://23.jpg', 1),
  ('http://45.jpg', 1),
  ('http://12.jpg', 2),
  ('http://8.jpg', 3),
  ('http://14.jpg', 4);

DELETE FROM users
where id=1;  
SELECT * FROM photos;
-- deleted all the photos that was related to user_id=1


-- ON DELETE SET NULL
CREATE TABLE photos(
  id serial PRIMARY KEY,
  url VARCHAR(200),
  user_id INTEGER REFERENCES users(id) ON DELETE SET NULL
);
INSERT INTO
  photos (url, user_id)
VALUES
  ('http://12.jpg', 2),
  ('http://8.jpg', 3),
  ('http://14.jpg', 4);


DELETE FROM users
where id = 4;
SELECT * FROM photos;



CREATE TABLE boats (id serial PRIMARY KEY, name VARCHAR(50));
INSERT INTO
  boats (name)
VALUES('boat1'),('boat2');
CREATE TABLE crew_members(
    id serial PRIMARY KEY,
    first_name VARCHAR(50),
    boat_id INTEGER REFERENCES boats(id)
  );;
INSERT INTO
  crew_members (first_name, boat_id)
VALUES
  ('person1', 1),('person2', 2),
  ('person2', 1),('person3', 2);

SELECT name,first_name
FROM boats INNER JOIN crew_members
on boats.id = crew_members.boat_id;

SELECT * FROM crew_members WHERE boat_id =1;


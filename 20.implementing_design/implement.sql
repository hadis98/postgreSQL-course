CREATE table users(
    id SERIAL PRIMARY KEY,
    created_at timestamp with time ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time ZONE DEFAULT CURRENT_TIMESTAMP,
    username varchar(30) not null,
    bio varchar(400),
    avatar varchar(200),
    phone varchar(25),
    email varchar(40),
    password varchar(50),
    status varchar(15),
    CHECK(COALESCE(phone,email) is not null)
);

CREATE table posts(
    id serial PRIMARY KEY,
    created_at timestamp with time ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time ZONE DEFAULT CURRENT_TIMESTAMP,
    url varchar(200) not null,
    caption varchar(240),
    lat REAL CHECK(lat is null OR (lat >=-90 AND lat<=90)),
    lng REAL CHECK(lng is null OR (lng >=-180 AND lng<=180)),
    user_id integer not null REFERENCES users(id) on DELETE CASCADE
);

CREATE table comments(
    id serial PRIMARY KEY,
    created_at timestamp with time ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time ZONE DEFAULT CURRENT_TIMESTAMP,
    contents varchar(240) not NULL,
    user_id integer not null REFERENCES users(id) on DELETE CASCADE,
    post_id integer not null REFERENCES posts(id) on DELETE CASCADE
);

CREATE table likes (
    id serial PRIMARY KEY,
    created_at timestamp with time ZONE DEFAULT CURRENT_TIMESTAMP,
    user_id integer not null REFERENCES users(id) on DELETE CASCADE,
    post_id integer REFERENCES posts(id) on DELETE CASCADE,
    comment_id integer REFERENCES comments(id) on DELETE CASCADE,
    CHECK(
        COALESCE((post_id)::BOOLEAN::INTEGER,0)
        +
        COALESCE((comment_id)::BOOLEAN::INTEGER,0)
        =1
    ),
    UNIQUE(user_id,post_id,comment_id)
);

CREATE TABLE photo_tags(
    id serial PRIMARY KEY,
    created_at timestamp with time ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time ZONE DEFAULT CURRENT_TIMESTAMP,
    user_id INTEGER not null REFERENCES users(id) on DELETE CASCADE,
    post_id INTEGER not null REFERENCES posts(id) on DELETE CASCADE,
    x integer not null,
    y integer not null,
    UNIQUE(user_id,post_id)
);

CREATE TABLE caption_tags(
    id serial PRIMARY KEY,
    created_at timestamp with time ZONE DEFAULT CURRENT_TIMESTAMP,
    user_id INTEGER not null REFERENCES users(id) on DELETE CASCADE,
    post_id INTEGER not null REFERENCES posts(id) on DELETE CASCADE,
    UNIQUE(user_id,post_id)
);

CREATE TABLE hashtags(
    id serial PRIMARY KEY,
    created_at timestamp with time ZONE DEFAULT CURRENT_TIMESTAMP,
    title varchar(20) not null UNIQUE   
);

CREATE TABLE hashtags_posts(
    id serial PRIMARY KEY,    
    hashtag_id INTEGER not null REFERENCES hashtags(id) on DELETE CASCADE,   
    post_id INTEGER not null REFERENCES posts(id) on DELETE CASCADE,
    UNIQUE(hashtag_id,post_id)
);

CREATE TABLE followers(
    id serial PRIMARY KEY,  
    created_at timestamp with time ZONE DEFAULT CURRENT_TIMESTAMP,  
    leader_id integer not null REFERENCES users(id) on DELETE CASCADE,
    follower_id integer not null REFERENCES users(id) on DELETE CASCADE,
    UNIQUE(leader_id,follower_id)
);

select * from caption_tags;
select * from comments;
select * from hashtags;
select * from likes; 
select * from hashtags_posts;
select * from posts;
SELECT username,
    count(*)
from users
    JOIN(
        SELECT user_id
        from photo_tags
        UNION ALL
        SELECT user_id
        from caption_tags
    ) as tags on tags.user_id = users.id
GROUP BY username
order by count(*) DESC;
CREATE VIEW recent_posts as(
    SELECT *
    FROM posts
    ORDER BY created_at DESC
    LIMIT 10
);
SELECT *
from recent_posts;
SELECT username
FROM recent_posts
    JOIN users ON users.id = recent_posts.user_id;
-- edit view
CREATE OR REPLACE VIEW recent_posts as(
        SELECT *
        FROM posts
        ORDER BY created_at DESC
        LIMIT 15
    );
-- delete view
DROP VIEW recent_posts;
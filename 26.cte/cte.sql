with tags AS(
    SELECT user_id,
        created_at
    from caption_tags
    UNION ALL
    SELECT user_id,
        created_at
    from photo_tags
)
SELECT username,
    tags.created_at
from users
    JOIN tags on tags.user_id = users.id
WHERE tags.created_at < '2010-01-07';


SELECT username,
    tags.created_at
from users
    JOIN(
        SELECT user_id,
            created_at
        from caption_tags
        UNION ALL
        SELECT user_id,
            created_at
        from photo_tags
    ) as tags on tags.user_id = users.id
WHERE tags.created_at < '2010-01-07';


explain with tags AS(
    SELECT user_id,
        created_at
    from caption_tags
    UNION ALL
    SELECT user_id,
        created_at
    from photo_tags
)
SELECT username, tags.created_at
from users
    JOIN tags on tags.user_id = users.id
WHERE tags.created_at < '2010-01-07';